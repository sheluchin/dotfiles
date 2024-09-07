[{1 :nvim-treesitter/nvim-treesitter
  :run ":TSUpdate"
  :config (fn []
            (require :nvim-treesitter.configs).setup
              {:highlight {:enable true
                           :additional_vim_regex_highlighting [:clojure :fennel]}
               :indent {:enable true}
               :textobjects {
                             :select {
                                      :enable true
                                      :lookahead true
                                      :keymaps {"af" "@function.outer"
                                                "if" "@function.inner"
                                                "ic" "@call.inner"
                                                "ac" "@call.outer"
                                                "ig" "@block.inner"
                                                "it" "@block.outer"
                                                "as" "@statement.outer"}
                                      :selection_modes {
                                                        "@parameter.outer" "v"
                                                        "@function.outer" "V"
                                                        "@class.outer" "<c-v>"}
                                      :include_surrounding_whitespace false}
                             :swap {:enable true
                                    :swap_next {"<M-l>" "@parameter.inner"}
                                    :swap_previous {"<M-h>" "@parameter.inner"}}}
               :incremental_selection {:enable true
                                       :keymaps {:init_selection "gh"
                                                 :node_incremental "gh"
                                                 :node_decremental "ghd"
                                                 :scope_incremental "ghu"}}
               :ensure_installed [:bash
                                  :clojure
                                  :commonlisp
                                  :dockerfile
                                  :fennel
                                  :gitcommit
                                  :html
                                  :java
                                  :javascript
                                  :json
                                  :lua
                                  :markdown
                                  :markdown_inline
                                  :python
                                  :sql
                                  :yaml
                                  :xml
                                  ; These must be present to override neovim builtins
                                  ; :help  doesn't work for some reason
                                  :c :lua :vim]})}]
