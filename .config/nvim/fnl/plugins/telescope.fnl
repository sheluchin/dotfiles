[{1 :nvim-telescope/telescope.nvim
  :dependencies [:nvim-telescope/telescope-ui-select.nvim
                 :nvim-lua/popup.nvim
                 :nvim-lua/plenary.nvim]
  :init (fn []
          (vim.keymap.set :n :<leader>ff ":lua require('telescope.builtin').find_files()<CR>" {:noremap true})
          (vim.keymap.set :n :<leader>fg ":lua require('telescope.builtin').live_grep()<CR>" {:noremap true})
          (vim.keymap.set :n :<leader>fb ":lua require('telescope.builtin').buffers()<CR>" {:noremap true})
          (vim.keymap.set :n :<leader>fh ":lua require('telescope.builtin').help_tags()<CR>" {:noremap true})
          (vim.keymap.set :n :<leader>: ":lua require('telescope.builtin').command_history()<CR>" {:noremap true}))
  :config (fn []
            (let [telescope (require :telescope)
                  actions (require :telescope.actions)
                  themes (require :telescope.themes)]
              (telescope.setup {:defaults {:file_ignore_patterns ["node_modules"]
                                           :find_command ["fd" "-t=f" "-a"]
                                           :mappings {:i {:<esc> actions.close
                                                          :<C-u> false}}
                                           :layout_strategy "vertical"
                                           :layout_config {:width 0.8}
                                           :path_display ["shorten"]
                                           :wrap_results true
                                           :vimgrep_arguments ["rg"
                                                               "--color=never"
                                                               "--no-heading"
                                                               "--with-filename"
                                                               "--line-number"
                                                               "--column"
                                                               "--smart-case"
                                                               "--iglob"
                                                               "!.git"
                                                               "--hidden"]}
                                :extensions {:ui-select (themes.get_dropdown {})}
                                :pickers {:find_files {:find_command ["rg"
                                                                      "--files"
                                                                      "--iglob"
                                                                      "!.git"
                                                                      "--hidden"]}
                                          :find_meetings {:find_command ["rg"
                                                                         "--files"
                                                                         "--iglob"
                                                                         "!.git"
                                                                         "--hidden"
                                                                         ; "--sort" "modified"
                                                                         "/media/alex/Verbatim/vimwiki/Obsidian Vault/Flightpath.fm/Meetings/"]}}})
              (telescope.load_extension "ui-select")
              ; (telescope.load_extension "heading")
              ; (telescope.load_extension "fzf"
              ))}]
