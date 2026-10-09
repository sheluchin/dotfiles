(ns dotfiles.tasks
  "Helpers for the home-manager flake in ~/dotfiles. See README.md."
  (:require [babashka.fs :as fs]
            [babashka.process :refer [shell]]
            [clojure.string :as str]))

(def home (str (fs/home)))
(def repo (str (fs/path home "dotfiles")))
(def links-file (str (fs/path repo "nix" "links.nix")))
(def flake (str repo "#alex"))
(def hm-profile (str (fs/path home ".local/state/nix/profiles/home-manager")))
(def adopt-marker "# bb adopt: new links go above this line")

(defn- sh
  "Runs in the repo. Only the first string is tokenized; pass other args separately."
  [& args]
  (apply shell {:dir repo} args))

(defn- die [& msg]
  (binding [*out* *err*] (println (str/join " " msg)))
  (System/exit 1))

(defn- untracked-nix-files
  "Flakes only see files git knows about; untracked nix files are silently ignored."
  []
  (->> (:out (shell {:dir repo :out :string}
                    "git ls-files --others --exclude-standard -- flake.nix flake.lock nix"))
       str/split-lines
       (remove str/blank?)))

(defn- warn-untracked []
  (when-let [files (seq (untracked-nix-files))]
    (println "WARNING: untracked, the flake can't see these. Run: git add -N"
             (str/join " " files))))

(defn build []
  (warn-untracked)
  (sh "home-manager build --flake" flake))

(defn switch []
  (warn-untracked)
  (sh "home-manager switch --flake" flake "-b" "hm-bak"))

(defn diff
  "Build, then show package changes vs the active generation."
  []
  (build)
  (sh "nix store diff-closures" hm-profile "./result"))

(defn update
  "Bump nixpkgs + home-manager pins, then show what would change."
  []
  (sh "nix flake update")
  (diff)
  (println "\nLooks good? Run: bb switch   Otherwise: git checkout flake.lock"))

(defn- link-targets
  "Repo-relative paths from every `link \"...\"` call in nix/links.nix."
  []
  (map second (re-seq #"link \"([^\"]+)\"" (slurp links-file))))

(defn check
  "Every link target exists in the repo, and every link in $HOME resolves."
  []
  (let [missing (remove #(fs/exists? (fs/path repo %)) (link-targets))
        files   (fs/path hm-profile "home-files")
        dangling (->> (fs/glob files "**" {:hidden true})
                      (filter fs/sym-link?)
                      (map #(str (fs/relativize files %)))
                      (remove #(fs/exists? (fs/path home %))))]
    (doseq [m missing] (println "missing in repo:" m))
    (doseq [d dangling] (println "dangling in ~:" d))
    (if (or (seq missing) (seq dangling))
      (System/exit 1)
      (println "OK:" (count (link-targets)) "links, all resolve"))))

(defn- confirm? [prompt]
  (print (str prompt " [y/N] "))
  (flush)
  (= "y" (str/lower-case (str/trim (or (read-line) "")))))

(defn rollback
  "Activate the previous home-manager generation."
  []
  (let [[_ prev] (str/split-lines
                  (:out (shell {:out :string} "home-manager generations")))
        path (some-> prev (str/split #" ") last)]
    (when-not path (die "No previous generation."))
    ;; Generations <= 23 predate the flake and have no links; activating one
    ;; would delete every link in ~.
    (when (<= (parse-long (second (re-find #"id (\d+)" prev))) 23)
      (die "Previous is a pre-flake generation; refusing:" prev))
    (println "Previous:" prev)
    (when (confirm? "Activate it?")
      (shell (str path "/activate")))))

(defn gc
  "Drop home-manager generations older than 30 days, then collect garbage."
  []
  (shell "home-manager expire-generations -30days")
  (shell "nix store gc"))

(defn- add-link! [home-rel repo-rel]
  (let [src (slurp links-file)
        line (format "    \"%s\".source = link \"%s\";\n" home-rel repo-rel)]
    (when-not (str/includes? src adopt-marker)
      (die "Marker not found in nix/links.nix:" adopt-marker))
    (spit links-file
          (str/replace-first src (str "    " adopt-marker)
                             (str line "    " adopt-marker)))))

(defn adopt
  "Move a file or dir from $HOME into the repo, link it back, and switch.
   Usage: bb adopt ~/.config/foo [--to foo/.config/foo]"
  [args]
  (let [[target & opts] args
        {:strs [--to]} (apply hash-map opts)]
    (when-not target (die "Usage: bb adopt <path in $HOME> [--to <repo path>]"))
    (let [abs (fs/absolutize (fs/expand-home target))
          home-rel (str (fs/relativize home abs))
          repo-rel (or --to home-rel)
          dest (fs/path repo repo-rel)]
      (cond
        (not (fs/starts-with? abs home)) (die abs "is not under" home)
        (fs/starts-with? abs repo) (die abs "is already inside the repo")
        (fs/sym-link? abs) (die abs "is a symlink; nothing to adopt")
        (not (fs/exists? abs)) (die abs "does not exist")
        (fs/exists? dest) (die dest "already exists in the repo"))
      (fs/create-dirs (fs/parent dest))
      (fs/move abs dest)
      (add-link! home-rel repo-rel)
      (sh "git add -N" (str dest))
      (println "Moved" (str abs) "->" (str dest))
      (try (switch)
           (catch Exception _
             (die "Switch failed;" (str abs) "is NOT linked yet. File is safe at"
                  (str dest) "- fix the error, then: bb switch")))
      (println "Done. Review and commit: git diff nix/links.nix"))))
