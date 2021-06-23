" ============================================================
" Install and configure plugins
" ============================================================
" Install vim-plug if it's not installed already.
if empty(glob('$XDG_CONFIG_HOME/nvim/autoload/plug.vim'))
  silent !curl -fLo $XDG_CONFIG_HOME/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.nvim/plugged')
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'Yggdroot/indentLine'
    Plug 'altercation/vim-colors-solarized'
    Plug 'mhinz/vim-signify'
    Plug 'dahu/vim-fanfingtastic'
    Plug 'eparreno/vim-l9'
    Plug 'janko-m/vim-test'
    Plug 'junegunn/vim-github-dashboard'
    Plug 'kassio/neoterm'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'majutsushi/tagbar'
    Plug 'mattn/emmet-vim'
    Plug 'mileszs/ack.vim'
    Plug 'mtth/scratch.vim'
    Plug 'nhooyr/neoman.vim'
    Plug 'nvie/vim-flake8'
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'simnalamburt/vim-mundo'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'tpope/vim-speeddating'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'
    Plug 'arecarn/fold-cycle.vim'
    Plug 'machakann/vim-highlightedyank'
    Plug 'neomake/neomake'
    Plug 'vimwiki/vimwiki'
    Plug 'mhinz/neovim-remote'
    " Plug 'ryanoasis/vim-devicons'
    Plug 'shime/vim-livedown'
    Plug 'chrisbra/csv.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim', " { 'commit': '9cc54fb3d3bfb44d7c6d549c78f0a125ec3281aa' }
    Plug 'frazrepo/vim-rainbow', {'for': 'clojure'}
    Plug 'mhinz/vim-startify'
call plug#end()


" vim-startify
let g:startify_change_to_dir = 0

" FZF
function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = float2nr(40)
  let width = float2nr(120)
  let horizontal = float2nr((&columns - width) / 2)
  let vertical = 6

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
command! -bang -nargs=* VimwikiAg
  \ call fzf#vim#ag(<q-args>,
  \                 {'dir': '~/vimwiki/'},
  \                 <bang>0)

let g:indentLine_color_term = 153
let g:tagbar_foldlevel=0
let g:ackprg='ag'

" vim-test
let g:neoterm_default_mod = 'botright'
let g:test#strategy = 'neoterm'
let g:test#python#runner = 'pytest'
let test#python#pytest#options = '-sv --cov-report=html --cov .'
let test#filename_modifier = ':p'  " Use absolute paths

" neoterm
nnoremap <Leader>r TREPLSend
vnoremap <Leader>r '<,'>TREPLSend
nnoremap <Leader>1 :T1 
nnoremap <F2> :call neoterm#toggle()<CR>

" nerdtree
let NERDTreeIgnore = ['\.pyc$', '__pycache__$']

" Mundo
set undofile
set undodir=~/.nvim/undo

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" Automatically open pop-up window for completions.
let g:acp_completeoptPreview=1

" Neomake
autocmd! BufWritePost * Neomake
" call neomake#configure#automake('nrwi', 500)
nnoremap <leader>j :lopen<CR>
nnoremap <leader>k :lclose<CR>


" vim-signify
let g:signify_vcs_list = [ 'git', ]

" VimWiki
nnoremap <Leader>v :Files ~/vimwiki/<cr>
let g:tagbar_type_vimwiki = {
          \   'ctagstype':'markdown'
          \ , 'kinds':['h:header']
          \ , 'sro':'&&&'
          \ , 'kind2scope':{'h':'header'}
          \ , 'sort':0
          \ , 'ctagsbin':'~/dotfiles/.config/nvim/vwtags.py'
          \ , 'ctagsargs': 'markdown'
          \ }
let g:vimwiki_root = $HOME . '/vimwiki/'
let wiki = {}
let wiki.path = $HOME . '/vimwiki/'
let wiki.nested_syntaxes = {'python': 'python', 'solidity': 'sol', 'sol': 'solidity'}
let wiki.syntax = 'markdown'
let wiki.ext = '.md'
let wiki.maxhi = 1
let g:vimwiki_list = [wiki]
" Vimwiki Header Colors
hi! link VimwikiHeader1 markdownH1
hi! link VimwikiHeader2 markdownH2
hi! link VimwikiHeader3 markdownH3
hi! link VimwikiHeader4 markdownH4
hi! link VimwikiHeader5 markdownH5
hi! link VimwikiHeader6 markdownH6

" neovim-remote
if has('nvim')
  let $VISUAL = 'nvr -cc split --remote-wait'
endif
