[
  ;; Example of a simple plugin with lazy loading
  {1 :bakpakin/fennel.vim
   :lazy true
   :ft [:fennel]}

  ;; Configuration for todo-comments.nvim with dependencies and custom setup
  {1 :folke/todo-comments.nvim
   :requires [:nvim-lua/plenary.nvim]
   ; :lazy true
   ; :cmd ["TodoQuickFix" "TodoTrouble" "TodoTelescope"] ;; Lazy load on specific commands
   :config (fn []
             ;; Setup the plugin
             (local todo (require :todo-comments))
             (todo.setup)

             ;; Custom highlight configuration
             (vim.cmd "highlight TodoFgNOTE guifg=green"))}

  {1 :Yggdroot/indentLine}
  {1 :stevearc/oil.nvim
   :mod :oil
   :config (fn []
             ;; Setup the oil plugin
             (local oil (require :oil))
             (oil.setup))}
  {1 :vim-test/vim-test
   :ft [:python]
   :mod :vimtest}
  {1 :tpope/vim-fugitive}
  {1 :tpope/vim-rhubarb}
  {1 :tpope/vim-unimpaired}
  {1 :tpope/vim-projectionist}
  {1 :tpope/vim-dispatch}
  {1 :dahu/vim-fanfingtastic}
  {1 :RRethy/vim-illuminate}
  {1 :lewis6991/gitsigns.nvim
   :config (fn []
             ;; Setup the gitsigns plugin
             (local gitsigns (require :gitsigns))
             (gitsigns.setup))}
  {1 :gbprod/yanky.nvim
   :config (fn []
             ;; Setup the yanky plugin
             (local yanky (require :yanky))
             (yanky.setup))}
  ;; Adding neoterm plugin with inline configuration
  {1 :kassio/neoterm
   :config (fn []
             ;; Set neoterm default mod to "botright"
             (set vim.g.neoterm_default_mod "botright"))}
  {1 :nvimdev/lspsaga.nvim
   :ft [:markdown]
   :config (fn []
             ;; Setup the gitsigns plugin
             (local lspsaga (require :lspsaga))
             (lspsaga.setup))}
  {1 :OXY2DEV/markview.nvim
   :lazy false  ;; Recommended to not lazy-load
   :dependencies [:nvim-treesitter/nvim-treesitter
                  :nvim-tree/nvim-web-devicons]
   :config (fn []
             ;; Setup markview with custom headings configuration
             (local markview (require :markview))
             (local presets (require :markview.presets))
             (markview.setup
               {:headings presets.headings.glow_lables}))}
  {1 :folke/which-key.nvim
   :event :VeryLazy
   :config (fn []
             (local which-key (require :which-key))
             (which-key.setup))}
]
