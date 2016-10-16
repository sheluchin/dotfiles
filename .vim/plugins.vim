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
    Plug 'mileszs/ack.vim'
    Plug 'mattn/emmet-vim'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-surround'
    Plug 'airblade/vim-gitgutter'
    Plug 'sjl/gundo.vim'
    Plug 'Yggdroot/indentLine'
    Plug 'Shougo/deoplete.nvim'
    Plug 'Yggdroot/indentLine'
    Plug 'janko-m/vim-test'
    Plug 'dahu/vim-fanfingtastic'
    Plug 'altercation/vim-colors-solarized'
    Plug 'majutsushi/tagbar'
    Plug 'scrooloose/nerdtree'
    Plug 'mtth/scratch.vim'
    Plug 'vim-scripts/AutoComplPop'
call plug#end()

let g:indentLine_color_term = 0
let g:tagbar_foldlevel=0
let g:ackprg='ag'

" vim-test
let g:test#strategy = 'neoterm'
let g:test#python#runner = 'pytest'
let test#python#pytest#options = '-sv --cov-report=html --cov summary'
let test#filename_modifier = ':p'  " Use absolute paths

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
