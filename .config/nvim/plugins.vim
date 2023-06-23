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
    Plug 'projekt0n/github-nvim-theme'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'Yggdroot/indentLine'
    Plug 'mhinz/vim-signify'
    Plug 'dahu/vim-fanfingtastic'
    Plug 'kassio/neoterm'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'majutsushi/tagbar'
    Plug 'mileszs/ack.vim'
    Plug 'mtth/scratch.vim'
    " Plug 'nvie/vim-flake8'
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'mbbill/undotree'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'tpope/vim-speeddating'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'
    Plug 'arecarn/fold-cycle.vim'
    Plug 'neomake/neomake'
    Plug 'vimwiki/vimwiki'
    Plug 'mhinz/neovim-remote'
    Plug 'shime/vim-livedown'
    Plug 'chrisbra/csv.vim', {'for': 'csv'}
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim', " { 'commit': '9cc54fb3d3bfb44d7c6d549c78f0a125ec3281aa' }
    Plug 'antoinemadec/coc-fzf'
    Plug 'tomlion/vim-solidity'
    Plug 'cespare/vim-toml'
    Plug 'tpope/vim-abolish'
    Plug 'guns/vim-sexp',    {'for': 'clojure'}
    " Plug 'liquidz/vim-iced', {'for': 'clojure'}
    " Plug 'liquidz/vim-iced-coc-source', {'for': 'clojure'}
    " Plug  'liquidz/vim-iced-neil', {'for': 'clojure'}
    " Plug 'liquidz/vim-iced-multi-session', {'for': 'clojure'}
    " Plug 'Olical/conjure'
    " Plug 'Olical/aniseed'
    " Plug 'prabirshrestha/vim-lsp'
    " Plug 'mattn/vim-lsp-settings'
    Plug 'tpope/vim-salve'
    Plug 'tpope/vim-projectionist'
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-classpath'
    " Plug 'vim-denops/denops.vim'
    " Plug 'liquidz/dps-parinfer'
    " Plug 'vim-denops/denops-helloworld.vim'
    Plug 'eraserhd/parinfer-rust', {'do':  'cargo build --release'}
    " Plug 'eraserhd/parinfer-rust', {'rtp': 'target/release', 'do': 'cargo build --release'}
    " Plug 'harrygallagher4/nvim-parinfer-rust'
    " Plug 'gpanders/nvim-parinfer'
    Plug 'mhinz/vim-startify'
    Plug 'yaegassy/coc-pylsp', {'do': 'yarn install --frozen-lockfile'}
    " Plug 'python-rope/ropevim'
    Plug '5long/pytest-vim-compiler', {'for': 'python'}
    Plug 'psf/black', { 'branch': 'stable', 'for': 'python'}
    Plug 'vim-test/vim-test/', {'for': 'python'}
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-textobjects', {'for': 'python'}
    Plug 'nvim-treesitter/playground'
    Plug 'AndrewRadev/linediff.vim'
    Plug 'AndrewRadev/splitjoin.vim'
    Plug 'RRethy/vim-illuminate'
    Plug 'chrisbra/Colorizer'
    " https://github.com/nvim-treesitter/nvim-treesitter/issues/2769#issuecomment-1094761251
    " Plug 'andymass/vim-matchup'
    Plug 'junegunn/vim-peekaboo'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    Plug 'TC72/telescope-tele-tabby.nvim'
    Plug 'gbprod/yanky.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'thinca/vim-localrc'
    Plug 'liuchengxu/vim-which-key'
    Plug 'bogado/file-line'
    Plug 'bakpakin/fennel.vim'
    Plug 'Olical/conjure'
    Plug 'clojure-vim/vim-jack-in'
call plug#end()

let g:colorizer_auto_color=1

let g:scratch_insert_autohide=0
let g:neoterm_default_mod='botright'

let g:parinfer_mode='smart'
let g:parinfer_force_balance=1
let g:sexp_enable_insert_mode_mappings=1
" let g:iced_enable_default_key_mappings=v:true
" let g:iced#clojuredocs#use_clj_docs_on_cljs=v:true
" let g:iced#nrepl#auto#does_switch_session=v:true " switch between clj/cljs sessions
" " let g:iced_multi_session#does_switch_session
" let g:iced_enable_clj_kondo_analysis=v:true
" let g:iced#nrepl#skip_evaluation_when_buffer_size_is_exceeded=v:true
" " let g:iced_formatter='cljstyle'

" autocmd VimEnter * lua require('parinfer').setup()
" aug VimIcedAutoFormatOnWriting
"   au!
"   let g:parinfer_enabled = 0
"   " Format whole buffer on writing files
"   " au BufWritePre *.clj,*.cljs,*.cljc,*.edn execute ':IcedFormatSyncAll'
"   " Format only current form on writing files
"   au BufWritePre *.clj,*.cljs,*.cljc,*.edn execute ':IcedFormatSync'
"   " au BufWritePre *.clj,*.cljs,*.cljc,*.edn call CocAction('format')
"   let g:parinfer_enabled = 1
" aug END

function! Expand(exp) abort
    let l:result = expand(a:exp)
    return l:result ==# '' ? '' : "file://" . l:result
endfunction

" vim-test
let g:neoterm_default_mod = 'botright'
let g:test#strategy = 'neoterm'
let g:test#python#runner = 'pytest'
let test#python#pytest#options = '-s --disable-pytest-warnings --no-header -vv'

lua << EOF
require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        -- ["ac"] = "@class.outer",
        ["ic"] = "@call.inner",
        ["ac"] = "@call.outer",
        ["ig"] = "@block.inner",
        ["it"] = "@block.outer",
        -- You can optionally set descriptions to the mappings (used in the desc parameter of
        -- nvim_buf_set_keymap) which plugins like which-key display
        --["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        ["as"] = "@statement.outer",
      },
      -- You can choose the select mode (default is charwise 'v')
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * method: eg 'v' or 'o'
      -- and should return the mode ('v', 'V', or '<c-v>') or a table
      -- mapping query_strings to modes.
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
      -- If you set this to `true` (default is `false`) then any textobject is
      -- extended to include preceding or succeeding whitespace. Succeeding
      -- whitespace has priority in order to act similarly to eg the built-in
      -- `ap`.
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * selection_mode: eg 'v'
      -- and should return true of false
      include_surrounding_whitespace = false,
    },
  },
}

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers['signature_help'], { border = 'single', close_events = { "CursorMoved", "BufHidden" }, }) vim.keymap.set('i', '<c-s>', vim.lsp.buf.signature_help) 
require('illuminate').configure({
    providers = {
        'regex',
   },
})
require('telescope').load_extension('tele_tabby')
require('telescope').load_extension('fzf')
require("yanky").setup({})
require("telescope").load_extension("yank_history")
local actions = require("telescope.actions")
require'nvim-web-devicons'.setup {
    default = true;
}
require('telescope').setup {
    defaults = {
      mappings = {
        i = {
          ["<esc>"] = actions.close,
          ["<C-u>"] = false
        },
      },
    },
    extensions = {
        tele_tabby = {
            use_highlighter = true,
        }
    },
    pickers = {
        jumplist = {
            theme = "dropdown",
            path_display = "tail",
            layout_config = { width = 0.9, height = 0.2 },
        }
    }
}
EOF

lua << EOF
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = { "clojure", "python", "c", "lua", "vim", "help", "query" },
  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    disable = { "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    -- NOTE: needs to be on for clojure https://github.com/nvim-treesitter/nvim-treesitter/issues/2966
    additional_vim_regex_highlighting = "clojure",
  },
}
EOF

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

let g:fzf_history_dir = '~/.local/share/fzf-history'
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('up:50%:hidden', '?'),
  \                 <bang>0)
command! -bang -nargs=* VimwikiAg
  \ call fzf#vim#ag(<q-args>,
  \                 {'dir': '~/vimwiki/'},
  \                 <bang>0)

let g:indentLine_color_term = 153
let g:tagbar_foldlevel=0
let g:ackprg='ag'

" nerdtree
let NERDTreeIgnore = ['\.pyc$', '__pycache__$']

" Undotree
set undofile
set undodir=~/.nvim/undo

" Automatically open pop-up window for completions.
let g:acp_completeoptPreview=1

" Neomake
autocmd! BufWritePost * Neomake

" vim-signify
let g:signify_vcs_list = [ 'git', ]

" VimWiki
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

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" nnoremap <silent> <Plug>(iced_eval_and_time) <Cmd>call iced#operation#setup_wrapper('(clojure.core/time *v)')<CR>g@

" aug Fixme
"   au!
"   au FileType clojure nmap <buffer> <Leader>eat <Plug>(iced_eval_and_time)<Plug>(sexp_outer_list)``
" aug END

let g:coc_snippet_next = '<tab>'

" let g:conjure#client#python#stdio#command = 'ipython -i'
let g:conjure#log#wrap = v:true
