" ============================================================
" Some functions I wrote to save time
" ============================================================
function! Reg()
    reg
    echo "Register: "
    let char = getchar()
    execute "normal! \"".nr2char(char)."p"
    redraw
    normal! k
endfunction

function! DiffToggle()
    if &diff
        diffoff
    else
        diffthis
    endif
:endfunction

" Appends the highlighted text to a new line in "a.
function! AppendToNewLine()
    let @a = @a . "\r"
    norm "Aygn
endfunction

" ==========================================================
" Testing functions
" ==========================================================

fu! OpenCoverage()
    :!open ../coverage_report/index.html
endfu

fu! OpenFileCoverage()
    let covdir = $VIRTUAL_ENV . '/../src/htmlcov/'
    let fname = @%
    let fname = substitute(fname, '.py', '.html', '')
    let fname = substitute(fname, '/', '_', '')
    let covfile = covdir . fname
    " let covfile = covdir . fname . '\#n' . line(".")
    :exe '!open ' . covfile
endfu

function! RunCurrentTest()
    " Save spot in file
    normal mx
    " Get the method name to @a
    normal [m0ww"ayw
    " Get the class name @b
    norm [[0w"byw

    " Return to place in file
    norm `x
    let fname = expand('%')
    let test_path = substitute(matchstr(fname, '.\{-}\.'), '/', '.', 'g')
    :exe 'Dispatch coverage run --source=' . matchstr(fname, '\w*') . ' manage.py test ' . test_path . @b . '.' . @a . ' --verbosity=2'
    " :exe '!coverage html'
    " :exe 'Dispatch ./manage.py test_coverage ' . fname
endfunction

function! InsertBreakPoint()
    " Inserts an ipdb breakpoint on the line below the cursor.
    normal oimport ipdb; ipdb.set_trace()
    :w
endfunction

" ==========================================================
" Deployment
" ==========================================================

function! PushCurrentBranch()
    " Runs ':Git push origin {branch name}'
    let @b = 'Git push origin ' . fugitive#head()
    exe @b
endfunction

" https://medium.com/@garoth/neovim-terminal-usecases-tricks-8961e5ac19b9
" Terminal settings
" Maps Leader-ESC to be the terminal’s insert mode escape sequence.
tnoremap <Leader><ESC> <C-\><C-n>

" Window navigation function
" Make ctrl-h/j/k/l move between windows and auto-insert in terminals
func! s:mapMoveToWindowInDirection(direction)
    func! s:maybeInsertMode(direction)
        stopinsert
        execute "wincmd" a:direction

        :au BufEnter * if &buftype == 'terminal' | :startinsert | endif
    endfunc

    execute "tnoremap" "<silent>" "<C-" . a:direction . ">"
                \ "<C-\\><C-n>"
                \ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
    execute "nnoremap" "<silent>" "<C-" . a:direction . ">"
                \ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
endfunc
for dir in ["h", "j", "l", "k"]
    call s:mapMoveToWindowInDirection(dir)
endfor
