[{1 :julienvincent/nvim-paredit
  :lazy true
  :ft ["clojure" "scheme" "lisp" "timl" "fennel" "janet"]
  :dependencies ["julienvincent/nvim-paredit-fennel"]
  :config (fn []
            (let [paredit (require :nvim-paredit)
                  paredit-fennel (require "nvim-paredit-fennel")]
              (paredit.setup
                {:keys
                 {:<A-H> [paredit.api.slurp_backwards "Slurp backwards"]
                  :<A-J> [paredit.api.barf_backwards "Barf backwards"]
                  :<A-K> [paredit.api.barf_forwards "Barf forwards"]
                  :<A-L> [paredit.api.slurp_forwards "Slurp forwards"]

                  :<localleader>w
                  [(fn []
                     (paredit.cursor.place_cursor
                       (paredit.wrap.wrap_element_under_cursor "( " ")")
                       {:placement :inner_start
                        :mode :insert}))
                   "Wrap element insert head"]

                  :<localleader>W
                  [(fn []
                     (paredit.cursor.place_cursor
                       (paredit.wrap.wrap_element_under_cursor "(" ")")
                       {:placement :inner_end
                        :mode :insert}))
                   "Wrap element insert tail"]

                  :<localleader>i
                  [(fn []
                     (paredit.cursor.place_cursor
                       (paredit.wrap.wrap_enclosing_form_under_cursor "( " ")")
                       {:placement :inner_start
                        :mode :insert}))
                   "Wrap form insert head"]

                  :<localleader>I
                  [(fn []
                     (paredit.cursor.place_cursor
                       (paredit.wrap.wrap_enclosing_form_under_cursor "(" ")")
                       {:placement :inner_end
                        :mode :insert}))
                   "Wrap form insert tail"]}})
              (paredit-fennel.setup)))}


 {1 :kylechui/nvim-surround
  :event "VeryLazy"
  :config (fn []
            (let [surround (require :nvim-surround)]
              (surround.setup)))}

 {1 :windwp/nvim-autopairs
  :event "InsertEnter"
  :opts {}}]
