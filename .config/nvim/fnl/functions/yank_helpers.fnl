(local {: autoload} (require :conjure.nfnl.module))
(local nvim (autoload :conjure.aniseed.nvim))
(local core (autoload :conjure.nfnl.core))
(local str (autoload :conjure.nfnl.string))
(local eval (autoload :conjure.eval))
(local extract (require :conjure.extract))

(fn yank-fq-sym
  [extra-opts]
  (let [word (extract.word {})]
    (when word
      (let [{: content} word]
        (eval.eval-str
          (core.merge
            {:code (str.join ["`" content])
             :origin :current-form
             :on-result
             (fn [result]
               (nvim.fn.setreg "+" result))}
            extra-opts))
        word))))

(fn yank-ns-sym
  [extra-opts]
  (let [word (extract.word {})]
    (when word
      (let [{: content} word]
        (eval.eval-str
          (core.merge
            {:code "(ns-name *ns*)"
             :origin :current-form
             :on-result
             (fn [result]
               (nvim.fn.setreg "+" result))}
            extra-opts))
        word))))

(vim.keymap.set :n :<leader>yq #(yank-fq-sym {}))
(vim.keymap.set :n :<leader>yn #(yank-ns-sym {}))
