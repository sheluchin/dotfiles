" ============================================================
" Install and configure plugins
" ============================================================
" Install vim-plug if it's not installed already.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'Shougo/deoplete.nvim'
    Plug 'Yggdroot/indentLine'
    Plug 'airblade/vim-gitgutter'
    Plug 'altercation/vim-colors-solarized'
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
    Plug 'sjl/gundo.vim'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-speeddating'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'
    Plug 'arecarn/fold-cycle.vim'
    Plug 'machakann/vim-highlightedyank'
call plug#end()

let g:indentLine_color_term = 153
let g:tagbar_foldlevel=0
let g:ackprg='ag'

" vim-test
let g:test#strategy = 'neoterm'
let g:test#python#runner = 'pytest'
let test#python#pytest#options = '-sv --cov-report=html --cov summary'
let test#filename_modifier = ':p'  " Use absolute paths

" neoterm
nnoremap <Leader>r TREPLSend
vnoremap <Leader>r '<,'>TREPLSend
nnoremap <Leader>1 :T1 
nnoremap <F2> :call neoterm#toggle()<CR>
 
" Gundo
let g:gundo_preview_bottom = 1

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" Automatically open pop-up window for completions.
let g:acp_completeoptPreview=1

" Deoplete
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

let g:deoplete#enable_at_startup = 1
