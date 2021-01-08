let g:submode_timeout = 0

call submode#enter_with('php', 'n', '', '<C-p>')
call submode#leave_with('php', 'n', '', '<ESC>')

call submode#map('php', 'n', 's', 'j', ':call PhpNext()<CR>')
call submode#map('php', 'n', 's', 'k', ':call PhpPrev()<CR>')
call submode#map('php', 'n', 's', 'f', ':call AppendFunction()<CR>')
call submode#map('php', 'n', 's', 'p', ':call ChangePrivate()<CR>')

" go to prev end or begin function and class properties
function! PhpPrev()
    silent ?^\(    }\|    p\)
endfunction

" got to next end or begin function and class properties
function! PhpNext()
    silent /^\(    }\|    p\)
endfunction

" append function
function! AppendFunction()
    silent /^    }
    call inputsave()
    let name = input("Name of function: ")
    call inputrestore()
    exec "normal o\<CR>public function " . name . "()\<CR>{\<CR>}"
    silent ?^    public function
    normal f)
    call inputsave()
    startinsert
endfunction

" change private of function or property
function! ChangePrivate()
    let line = getline('.')
    if stridx(line, 'public') != -1
        silent :s/public/private/g
    elseif stridx(line, 'private') != -1
        silent :s/private/protected/g
    elseif stridx(line, 'protected') != -1
        silent :s/protected/public/g
    endif
endfunction
