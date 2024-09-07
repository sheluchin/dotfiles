(import-macros {: map : augroup : autocmd} :macros)

(map :n :<leader>w #(vim.cmd {:cmd "write"}))

; ctrl-jklm  changes to that split
(map :n :<C-j> "<C-w>j")
(map :n :<C-k> "<C-w>k")
(map :n :<C-l> "<C-w>l")
(map :n :<C-h> "<C-w>h")

; Quit window on <leader>q
(map :n :<leader>q #(vim.cmd {:cmd "quit"}) {:noremap true})

; Remove search highlight
(map :n "<leader>," ":nohlsearch<cr>")

; Remove trailing whitespace on <leader>S
(map :n :<leader>S ":%s/\\s\\+$//<cr>:let @/=''<CR>")

; Select the item in the list with enter
;(map :i :<CR> "<expr> pumvisible() ? \"<C-y>\" : \"<C-g>u<CR>\"")

; Jump to next/previous merge conflict marker
;(map :n :]<silent>v "/\\v^(\\<\\|=\\|\\>){7}([^=].+)?$<CR>")
;(map :n :[<silent>v "?\\v^(\\<\\|=\\|\\>){7}([^=].+)?$<CR>")

; Jump to next/prev terminal command
;(map :n :]<silent>; "/^+\\d\\d:\\d\\d $ \\zs.*$<CR>")
;(map :n :[<silent>; "?^+\\d\\d:\\d\\d $ \\zs.*$<CR>")

; Show buffers and select one.
(map :n :gb ":ls<CR>:b<space>")

; Load my alex_vimrc
(map :n :<leader>ev ":tabe $MYVIMRC<CR>")
; TODO: use a variable for the fnl/config dir
(map :n :<leader>ep ":tabe $HOME/dotfiles/.config/nvim/fnl/config/plugin.fnl<CR>")
(map :n :<leader>em ":tabe $HOME/dotfiles/.config/nvim/fnl/config/mapping.fnl<CR>")

; Edit on a specific line
(map :n :<leader>e ":e+")

; Select the pasted text.
(map :n :<expr>gp "`[' . strpart(getregtype(), 0, 1) . '`]'")

; expands %% to current file's directory in command-line mode
(map :c :%% "<C-R>=fnameescape(expand('%:h')).'/'<CR>")

; Open the current window in a new tab
(map :n :<F4> ":tabedit %<CR>")

; Close the current tab. Returns to old position
(map :n :<F5> ":tabclose<CR>")

; Toggle diff
(map :n :<Leader>df ":call DiffToggle()<CR>")

; Git
; Push the current branch (uses Fugitive)
(map :n :<F12> ":Git<CR>")
(map :n :<Leader>gp ":Git push")
(map :n :hs ":Gitsigns stage_hunk<cr>")
(map :n :hu ":Gitsigns reset_hunk<cr>")

; Append highlighted text to a new line in "a.
(map :n :<Leader>yy ":call AppendToNewLine()<cr>")

; Use arrow keys to resize windows
(map :n :<up> "<C-W>+")
(map :n :<down> "<C-W>-")
(map :n :<left> "3<C-W><")
(map :n :<right> "3<C-W>>")

; Window Resizing
(map :n :<Leader>- "<C-w>_")
(map :n :<Leader>= "<C-w>=")

; Exit terminal emulator back to normal mode
(map :t :jk "<C-\\><C-n>")

; Go to start and end of line in cmd/search mode
(map :c :<C-a> "<home>")
(map :c :<C-e> "<end>")

; In the quickfix window, <CR> is used to jump to the error under the cursor, so undefine the mapping there.
; (vim.cmd "autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>")
; (vim.cmd "autocmd BufReadPost location-list nnoremap <buffer> <CR> <CR>")

; Set working directory
(map :n :<leader>. ":lcd %:p:h<CR>" {:noremap true})

(fn diff-toggle []
  (set vim.o.diff (not vim.o.diff)))

(vim.keymap.set :n :<leader>df #(diff-toggle) {:noremap true
                                               :silent true})

(map :n :<leader>bp "obreakpoint()<ESC>")

(map :n :<leader>tr ":T !!<CR>")

(map :n :<leader>tn ":TestNearest<cr>")

(map :n :<S-PageUp> ":Gitsigns prev_hunk<CR>" {:noremap true})
(map :n :<S-PageDown> ":Gitsigns next_hunk<CR>" {:noremap true})

; (map :n :<leader>ic ":ToggleTermSendCurrentLine<CR>")
; (map :v :<leader>iv ":ToggleTermSendVisualLines<CR>")
; (map :v :<leader>iV ":ToggleTermSendVisualSelection<CR>")
(map :n :<C-\> ":Ttoggle<cr>" {:noremap true})
(map :n :<leader>r ":TREPLSendSelection<cr>" {:noremap true})

(map :n :<leader>ef ":ConjureEval ( *1)<Left><Left><Left><Left>" {:noremap true})
(map :n :<leader>el ":ConjureEval (-> *1 )<Left>" {:noremap true})
(map :n :<leader>eL ":ConjureEval (->> *1 )<Left>" {:noremap true})
(map :n :<cr> ":ConjureEvalCurrentForm<cr>" {:noremap true})
(map :n :<tab> ":ConjureEvalWord<cr>" {:noremap true})
(map :n :<s-cr> ":ConjureEvalRootForm<cr>" {:noremap true})
; (map :n :<leader>ed "yiw:ConjureEval (clojure.repl/doc *1)<Left><Left><Left><Left>" {:noremap true})

(map :n :<F8> ":Lspsaga outline<cr>" {:noremap true})

;; FIXME: I want to use Lspsaga only in markdown files but it doesn't seem to be working
; (autocmd [:FileType] 
;   {:pattern "md"
;    :callback (fn []
;                (vim.keymap.set "n" "<leader>lr" ":Lspsaga finder<CR>" {:buffer true}))})
