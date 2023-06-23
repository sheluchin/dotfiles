#!/usr/bin/env bb
(require '[clojure.java.shell :refer [sh]]
         '[babashka.process :as p :refer [process]]
         '[cheshire.core :as json])
; (sh "swaymsg -t get_tree")
(let [tree (-> (process "swaymsg -t get_tree" {:out :string})
               (p/check)
               :out
               (json/parse-string true))]
  (->> tree
       :nodes))
       ; (map :floating_nodes)))

(process "swaymsg workspace \"2: web\"")
