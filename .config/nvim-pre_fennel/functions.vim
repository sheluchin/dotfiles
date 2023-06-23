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

" ==========================================================
" Deployment
" ==========================================================

function! PushCurrentBranch()
    " Runs ':Git push origin {branch name}'
    let @b = 'Git push origin ' . FugitiveHead()
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


" Convert between hex and dec http://vim.wikia.com/wiki/Convert_between_hex_and_decimal
command! -nargs=? -range Dec2hex call s:Dec2hex(<line1>, <line2>, '<args>')
function! s:Dec2hex(line1, line2, arg) range
  if empty(a:arg)
    if histget(':', -1) =~# "^'<,'>" && visualmode() !=# 'V'
      let cmd = 's/\%V\<\d\+\>/\=printf("0x%x",submatch(0)+0)/g'
    else
      let cmd = 's/\<\d\+\>/\=printf("0x%x",submatch(0)+0)/g'
    endif
    try
      execute a:line1 . ',' . a:line2 . cmd
    catch
      echo 'Error: No decimal number found'
    endtry
  else
    echo printf('%x', a:arg + 0)
  endif
endfunction

command! -nargs=? -range Hex2dec call s:Hex2dec(<line1>, <line2>, '<args>')
function! s:Hex2dec(line1, line2, arg) range
  if empty(a:arg)
    if histget(':', -1) =~# "^'<,'>" && visualmode() !=# 'V'
      let cmd = 's/\%V0x\x\+/\=submatch(0)+0/g'
    else
      let cmd = 's/0x\x\+/\=submatch(0)+0/g'
    endif
    try
      execute a:line1 . ',' . a:line2 . cmd
    catch
      echo 'Error: No hex number starting "0x" found'
    endtry
  else
    echo (a:arg =~? '^0x') ? a:arg + 0 : ('0x'.a:arg) + 0
  endif
endfunction
