(local {: autoload} (require :nfnl.module))
(local core (autoload :nfnl.core)) 

;generic mapping leaders configuration
(vim.keymap.set :n :<space> :<nop> {:noremap true})
(require "config.mapping")

(set vim.g.python_host_prog "/home/alex/.pyenv/versions/neovim2/bin/python")
(set vim.g.python3_host_prog "/home/alex/.pyenv/versions/neovim3/bin/python")

;don't wrap lines
; (nvim.ex.set :nowrap)

;sets a nvim global options
(let [options
      {;settings needed for compe autocompletion
       :completeopt "menuone,noselect"
       ;case insensitive search
       :ignorecase true
       ;smart search case
       :smartcase true
       ;shared clipboard with linux
       :clipboard "unnamedplus"
       ;:syntax true
       ;:filetype true
       ;:filetype-plugin-indent true
       :shell (os.getenv "SHELL")
       :relativenumber true
       :number true
       :numberwidth 1
       :background "light"
       :title true
       :wildmenu true
       :wildmode "full"
       :colorcolumn "80,120"
       :clipboard "unnamedplus"
       ;Open new split panes to right and bottom, which feels more natural
       :splitright true
       :splitbelow true
       :list true
       ;displays tabs with :set list & displays when a line runs off-screen
       :listchars "tab:>-,eol:$,trail:-,precedes:<,extends:>"
       ; :scrolloff 999
       }]
  (each [option value (pairs options)]
    (core.assoc vim.o option value)))


{}


