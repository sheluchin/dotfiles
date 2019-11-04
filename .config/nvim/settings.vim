" ==========================================================
" Basic Settings
" ==========================================================
colorscheme PaperColor
syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
set shell=$SHELL
set relativenumber            " Use relative line numbers
set number                    " Display line numbers
set numberwidth=1             " using only 1 column (and 1 space) while possible
set background=light          " We are using dark background in vim
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.
set colorcolumn=80,120        " Display a line at 120 columns
set clipboard=unnamedplus     " Use system clipboard
hi Comment cterm=italic       " italicize comments

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**

set grepprg=ack         " replace the default grep program with ack


""" Insert completion
" don't select first item, follow typing in autocomplete
set completeopt=menuone,longest,preview
set pumheight=6             " Keep a small completion window


""" Moving Around/Editing
set cursorline              " have a line indicate the cursor location
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=3             " Keep 3 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
set nowrap                  " don't wrap text
set linebreak               " don't wrap textin the middle of a word
set autoindent              " always set autoindenting on
set smartindent             " use smart indent if there is no indent file
set tabstop=4               " <tab> inserts 4 spaces
set shiftwidth=4            " but an indent level is 2 spaces wide.
set textwidth=120           " limit to 120 columns
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>         " show matching <> (html mainly) as well
set foldmethod=indent       " allow us to fold on indents
set foldlevel=99            " don't fold by default
hi Folded ctermbg=254       " give folds a light background
set cindent                 " Indent according to c rules
" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" Show absolute line numbers when the window isn't in focus.
au WinEnter * setl rnu | au WinLeave * setl nornu

"""" Reading/Writing
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noautoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.

"""" Messages, Info, Status
set ls=2                    " always show status line
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
set noerrorbells
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler                   " Show some info, even without statuslines.
set laststatus=2            " Always show statusline, even if only 1 window.
set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}

" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:>
set list

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

""" Neovim's Terminal
highlight TermCursor ctermfg=green guifg=green
autocmd BufEnter term://* startinsert

""" Neovim Python 3 support
let g:python_host_prog = '/home/alex/.pyenv/versions/2.7.12/bin/python2.7'
let g:python3_host_prog = '/home/alex/.pyenv/versions/3.7.4/bin/python3.7'

" Replace text in place if using neovim
if exists('&inccommand')
  set inccommand=split
endif

set mouse=a  " Let the mouse work
