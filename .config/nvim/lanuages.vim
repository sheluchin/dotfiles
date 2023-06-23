" ===========================================================
" FileType specific changes
" ============================================================
" HTML
autocmd FileType html,xhtml,xml,css setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" vimwiki
au FileType vimwiki setlocal cocu=
au FileType markdown setlocal cocu=

" Python
"au BufRead *.py compiler nose
" au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

nmap gt <Plug>(neoterm-repl-send)
xmap gt <Plug>(neoterm-repl-send)
nmap gtt <Plug>(neoterm-repl-send-line)
nmap <Leader>bp obreakpoint()<Esc>
nmap <localleader>f  <Plug>(coc-format-selected)
nmap <Leader>tn  :TestNearest<cr>

" Spell checking and automatic wrapping at the recommended 72 columns for git commit messages.
autocmd Filetype gitcommit setlocal spell textwidth=72

" Add the virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    # Looted from virtualenv; should not require modification, since it's defined relatively
    # See: https://stackoverflow.com/a/33637414
    activator = '/home/alex/dotfiles/.config/nvim/activate_this.py'
    with open(activator) as f: exec(f.read(), {'__file__': activator})
EOF
endif

" Markdown
autocmd FileType markdown,vimwiki setlocal sw=2 tw=80 colorcolumn=80 spell

" clojure
au FileType cljs,clj call rainbow#load()
