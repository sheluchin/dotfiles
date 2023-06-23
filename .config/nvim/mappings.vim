" ============================================================
" Mappings, including those for plugins
" ============================================================
let mapleader="\<Space>"      " change the leader to be the Spacebar

nnoremap <Leader>w :w<CR>

" Reload Vimrc
map <silent> <leader>V :source ~/.nvimrc<CR>:filetype detect<CR>:exe ":echo 'nvimrc reloaded'"<CR>

" open/close the quickfix window
nmap <leader>c :copen<CR>
nmap <leader>cc :cclose<CR>

" ctrl-jklm  changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" NerdTree
map <leader>n :NERDTreeToggle<CR>
nmap <F6> :NERDTreeFind<CR>

" Fugitive
nmap <F12> :Git<CR>
nnoremap <Leader>hs :Git add -p -- %<cr>

" vim-signify
nnoremap <Leader>hu :SignifyHunkUndo<cr>
nnoremap <Leader>hd :SignifyHunkDiff<cr>

" Tagbar
nmap <F8> :TagbarToggle<CR>

" neoterm
nnoremap <Leader>r TREPLSend
vnoremap <Leader>r '<,'>TREPLSend
nnoremap <Leader>1 :T1
nnoremap <F2> :Ttoggle<CR>
nnoremap <leader>tq :call neoterm#close_all()<cr>
nnoremap <leader>tc :call neoterm#clear()cr>
" Repeat last command
nnoremap <leader>tr :T !!<cr>
" nmap gxx <Plug>(neoterm-repl-send-line)
" xmap gx <Plug>(neoterm-repl-send)
" nmap gx <Plug>(neoterm-repl-send)

" Fuzzy searching
nmap <leader>B <Esc>:BLines<CR>
nmap <leader>G <Esc>:GFiles?<CR>
nmap <leader>C <Esc>:Commits<CR>
nmap <leader>b <Esc>:Buffers<CR>
nmap <leader>a <Esc>:Ag<CR>
noremap <leader>A <Esc>:VimwikiAg<CR>
nmap <leader>f <Esc>:call fzf#vim#files('', fzf#vim#with_preview('right'))<CR>
nmap <leader>f <Esc>:GFiles<CR>
nmap <leader>/ <Esc>:History/<CR>
nmap <leader>: <Esc>:History:<CR>

" peak at definition of tag under cursor
nnoremap <F10> <C-W>}

" coc.nvim
" jump to definition
nnoremap <C-]> :call CocAction('jumpDefinition')<CR>
" float window confirmation
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"
" snippet navigation
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" coc.nvim / clojure-lsp
nnoremap <silent> crmf :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'move-form', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1, input("File: ", "", "file")]})<CR>
nnoremap <silent> crml :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'move-to-let', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1, input('Binding name: ')]})<CR>
nnoremap <silent> crel :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'expand-let', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crcc :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'cycle-coll', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crdk :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'destructure-keys', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> cref :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'extract-function', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1, input('Function name: ')]})<CR>
nnoremap <silent> crfe :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'create-function', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
" TODO: doesn't work
" nnoremap <silent> crrk :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'cycle-keyword-auto-resolve', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> <C-r>k :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'move-coll-entry-up', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> <C-r>j  :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'move-coll-entry-down', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nmap <localleader>cc :Commands<cr>
nmap <leader>rn <Plug>(coc-rename)
nmap <LocalLeader>tw \wdoto) tap><ESC>
nmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>i <Plug>(coc-implementation)
nmap <leader>u <Plug>(coc-references)
nmap <silent> gd <Plug>(coc-definition)

" Load the Mundo window
map <leader>g :MundoToggle<CR>
"
" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Quit window on <leader>q
nnoremap <leader>q :q<CR>

" hide matches on <leader>space
nnoremap <leader>, :nohlsearch<cr>

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" Select the item in the list with enter
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Jump to next/previous merge conflict marker
nnoremap <silent> ]v /\v^(\<\|\=\|\>){7}([^=].+)?$<CR>
nnoremap <silent> [v ?\v^(\<\|\=\|\>){7}([^=].+)\?$<CR>

" Jump to next/prev terminal command
nnoremap <silent> ]; /^+\d\d:\d\d \$ \zs.*$<CR>
nnoremap <silent> [; ?^+\d\d:\d\d \$ \zs.*$<CR>

" Highlight merge conflict markers
" match Todo '\v^(\<|\=|\>){7}([^=].+)?$'

" Show buffers and select one.
nnoremap gb :ls<CR>:b<space>

" Load my alex_vimrc
noremap <leader>ev :tabe $MYVIMRC<CR>

" Edit on a specific line
noremap <leader>e :e+

" Select the pasted text.
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" expands %% to current file's directory in command-line mode
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<CR>

nmap <F4> :tabedit %<CR>      " Open the current window in a new tab
nmap <F5> :tabclose<CR>       " Close the current tab. Returns to old position

" Loads files containing search term into the arg list for argdo operations
" nnore <leader>A :args `ack -l `<left>

" Toggle diff
nnoremap <silent> <Leader>df :call DiffToggle()<CR>

" Push the current branch (uses Fugitive)
map <Leader>gp :call PushCurrentBranch()

" Append highlighted text to a new line in "a.
map <Leader>yy :call AppendToNewLine()<cr>

" Use arrow keys to resize windows
noremap <up> <C-W>+
noremap <down> <C-W>-
noremap <left> 3<C-W><
noremap <right> 3<C-W>>

" Window Resizing
nnoremap <Leader>- <C-w>_
nnoremap <Leader>= <C-w>=

" Exit terminal emulator back to normal mode
tnoremap jk <C-\><C-n>

" Go to start and end of line in cmd/search mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" In the quickfix window, <CR> is used to jump to the error under the cursor, so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
autocmd BufReadPost location-list nnoremap <buffer> <CR> <CR>

" Search for the last used terminal command
" TODO: make these only apply in a terminal and change to ]c (lowercase)
" nnoremap <silent> ]C /\v^\d{2}\:\d{2}\s\$\s\zs.*\ze<CR>
" nnoremap <sient> [C ?\v^\d{2}\:\d{2}\s\$\s\zs.*\ze<CR>

" Linters / Neomake
nnoremap <leader>j :lopen<CR>
nnoremap <leader>k :lclose<CR>

" Generate tags for your current virtualenv
map <S-F11>:!ctags --tag-relative -L -R --fields=+l --languages=python --python-kinds=-iv -f "$dir/$$.tags" $(python -c "import os, sys; print(' '.join('{}'.format(d) for d in sys.path if os.path.isdir(d)))")<cr>

" Generate a table of contents from a GitHub Markdown file
nmap <Leader>m :r !/home/alex/repos/FOSS/github-markdown-toc/gh-md-toc %<CR>

" vimwiki
nnoremap <Leader>v :Files ~/vimwiki/<cr>

" Insert iso8601 timestamp
nnoremap <Leader>D :r!date "+\%FT\%T\%z"<CR>

" clojure / vim-iced
nnoremap <Leader>if :IcedEval ( *1)<Left><Left><Left><Left>
nnoremap <Leader>id :IcedEval (lambdaisland.deep-diff2/diff *2 *1)<CR>
nnoremap <LocalLeader>tw \wdoto) tap><ESC>
nnoremap <LocalLeader>tt \idoto) tap><ESC>
nnoremap <LocalLeader>bb :call fzf#run({'source': 'bb tasks \| tail -n +3 \| cut -f1 -d " "', 'sink': 'T bb'})<cr>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" yanky
lua << EOF
vim.keymap.set({"n","x"}, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({"n","x"}, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({"n","x"}, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({"n","x"}, "gP", "<Plug>(YankyGPutBefore)")
vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")
EOF

nmap <LocalLeader>tj :Telescope jumplist<cr>
nmap <LocalLeader><Leader> :Telescope tele_tabby list<cr>
