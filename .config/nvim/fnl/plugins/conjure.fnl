[{1 :Olical/conjure
  :branch "main"
  :init (fn []
          (set vim.g.conjure#mapping#doc_word "K")
          (set vim.g.conjure#client#clojure#nrepl#eval#auto_require false)
          (set vim.g.conjure#client#clojure#nrepl#connection#auto_repl#enabled true)
          (set vim.g.conjure#log#wrap true)
          ; Uncomment the following line if you want to use IPython
          ; (set vim.g.conjure#client#python#stdio#command "ipython --classic")
          (set vim.g.conjure#client#python#stdio#command "python -iq")
          (set vim.g.conjure#client#fennel#aniseed#deprecation_warning false)
          ; Uncomment and adjust the following lines if needed
          ; (set vim.g.conjure#client#python#stdio#prompt_pattern "In %[%d+%]: ")
          ; (set vim.g.conjure#client#python#stdio#prompt_pattern "In ")
          ; (set vim.g.conjure#filetype_client {"markdown" "conjure.client.clojure.nrepl"})
          )}]
