"#####################################
"# KEYBINDING
"#####################################

" nmap <A-j> :call PhpNext()<CR>
" nmap <A-k> :call PhpPrev()<CR>

nmap <C-p>f :call PhpAppendFunction()<CR>
nmap <C-p>F :call PhpPrependFunction()<CR>
nmap <C-p>yf :call PhpCopyFunction()<CR>
nmap <C-p>ypf :call PhpDuplicateFunction()<CR>
nmap <C-p>df :call PhpDeleteFunction()<CR>
nmap <C-p>rf :call PhpRenameFunction()<CR>

nmap <C-p>a :call PhpAppendArgumentToCurrentFunction()<CR>
" nmap <C-p>da1 :call PhpDeleteArgument(1)<CR>
" nmap <C-p>ca1 :call PhpChangeArgument(1)<CR>
" nmap <C-p>cat1 :call PhpChangeArgumentType(1)<CR>

nmap <C-p>p :call PhpAppendProperty2("private")<CR>
nmap <C-p>P :call PhpAppendProperty2("public")<CR>

nmap <C-p>di :call PhpAppendDependencyInjection()<CR>

nmap <C-p>v :call PhpChangeVisibility()<CR>

nmap <C-p>ic :call PhpClass()<CR>
nmap <C-p>iac :call PhpAbstractClass()<CR>
nmap <C-p>ii :call PhpInterface()<CR>
nmap <C-p>in :call PhpNamespace()<CR>

nmap <C-p>l :call PhpLog()<CR>

"#####################################
"# INSERT
"#####################################

augroup php_insert_end
    autocmd!
    autocmd InsertLeave *.php call PhpInsertEnd()
augroup END

let g:phpInsertStack = []

function! PhpInsertBegin(command)
    call add(g:phpInsertStack, a:command)
    startinsert
endfunction

function! PhpAppendBegin(command)
    call add(g:phpInsertStack, a:command)
    startinsert!
endfunction

function! PhpInsertEnd()
    if len(g:phpInsertStack) == 0
        return
    endif
    let l:command = g:phpInsertStack[0]
    call remove(g:phpInsertStack, 0)
    exec "call " . l:command 
endfunction

"#####################################
"# POSITION
"#####################################

function! PhpRememberPosition()
    let g:phpPosition = getpos(".")
endfunction

function! PhpRestorePosition()
    call setpos(".", g:phpPosition)
endfunction

"#####################################
"# FUNCTIONS
"#####################################

" go to prev end or begin function and class properties
function! PhpPrev()
    silent ?^    p
    normal! zz
    
    silent! call repeat#set(":call PhpPrev()\<CR>", v:count)
endfunction

" got to next end or begin function and class properties
function! PhpNext()
    silent /^    p
    normal! zz

    silent! call repeat#set(":call PhpNext()\<CR>", v:count)
endfunction

function! PhpLog()
    exec "normal! odie(print_r([], true));"
    normal F]
    call inputsave()
    startinsert
endfunction

" init namespace
function! PhpNamespace()
    let path = substitute(fnamemodify(expand("%:p:h"), ":~:."), '/', '\', 'g') 
    let namespace = search("^namespace ")
    exec "normal! Cnamespace " . path . ";"
endfunction

" init class
function! PhpClass()
    call PhpObject("final class")
endfunction

" init abstract class
function! PhpAbstractClass()
    call PhpObject("abstract class")
endfunction

" init interface
function! PhpInterface()
    call PhpObject("interface")
endfunction

" append dependency injection
function! PhpAppendDependencyInjection()
    call PhpRememberPosition()

    " find or create constructor
    let l:constructorBegin = search('public function __construct(', 'ew')
    if l:constructorBegin == 0
        call PhpAppendConstructor()
        let l:constructorBegin = search('public function __construct(', 'ew')
    endif

    call PhpAppendArgument()

    call PhpInsertBegin("PhpAppendDependencyInjectionEnd()")
endfunction

function! PhpAppendDependencyInjectionEnd()
    " copy arguments
    let l:constructorBegin = search('public function __construct(', 'bew')
    normal! l"pyi)
    let l:input = trim(@p)
    if len(l:input) == 0
        return
    endif

    let l:arguments = split(l:input, ',')

    " set properies value by arguments
    let l:constructorBegin = search("{")
    for argument in l:arguments
        let l:typeAndName = split(trim(argument))
        let l:propertyExist = search("^    \\(private\\|public\\|protected\\) " . l:typeAndName[1], 'wn')
        if l:propertyExist == 0
            let l:name = typeAndName[1][1:]
            exec "normal! o$this->" . l:name . " = $" . l:name . ";"
        endif
    endfor

    " add properies
    normal! G
    let l:lastProperty = search("^    \\(private\\|public\\|protected\\) \\$", 'b')
    if l:lastProperty == 0
        let l:beginOfClass = search("^{")
    else
        exec "normal! o"
    endif
    for argument in l:arguments
        let l:typeAndName = split(trim(argument))
        let l:propertyExist = search("^    \\(private\\|public\\|protected\\) " . l:typeAndName[1], 'wn')
        if l:propertyExist == 0
            exec "normal! o/**\<CR>@var " . l:typeAndName[0] . "\<CR>/\<CR>private " . l:typeAndName[1] . ";"
        endif
    endfor

    call PhpRestorePosition()
endfunction

" append property
function! PhpAppendProperty2(visibility)
    call PhpRememberPosition()

    normal G
    let l:lastProperty = search("^    \\(private\\|public\\|protected\\) \\$", 'b')
    if l:lastProperty == 0
        let l:beginOfClass = search("^{")
        exec "normal! o/**"
    else
        exec "normal! o\<CR>/**"
    endif
    exec "normal! o@var "

    call PhpAppendBegin("PhpAppendProperty2End(\"" . a:visibility . "\")")
endfunction

function! PhpAppendProperty2End(visibility)
    exec "normal! o/\<CR>" . a:visibility . " $;"

    call PhpInsertBegin("PhpAppendProperty2End2(\"" . a:visibility . "\")")
endfunction

function! PhpAppendProperty2End2(visibility)
    call PhpRestorePosition()

    silent! call repeat#set(":call PhpAppendProperty2(\"" . a:visibility . "\")\<CR>", v:count)
endfunction

" append argument
function! PhpAppendArgumentToCurrentFunction()
    call PhpRememberPosition()

    let l:funcitonBegin = search("function \\w\\+(", "bew")
    call PhpAppendArgument()

    call PhpInsertBegin("PhpRestorePosition()")
endfunction

" append function
function! PhpAppendFunction()
    call inputsave()
    let name = input("{function name}: ")
    call inputrestore()
    if strlen(name) == 0
        return
    endif
    let lastFunction = search("^    }")
    call PhpInsertFunction(name, lastFunction)
endfunction

" prepend function
function! PhpPrependFunction()
    call inputsave()
    let name = input("Name of function: ")
    call inputrestore()
    if strlen(name) == 0
        return
    endif
    let lastFunction = search("^    }", 'b')
    call PhpInsertFunction(name, lastFunction)
endfunction

" copy function
function! PhpCopyFunction()
    call PhpRememberPosition()

    let l:funcitonBegin = search("^    \\(private\\|public\\|protected\\) function", "b")
    normal! V
    let l:funcitonEnd = search("^    }", "e")
    normal! y

    call PhpRestorePosition()
endfunction

" duplicate function
function! PhpDuplicateFunction()
    call PhpCopyFunction()

    let l:funcitonEnd = search("^    }", "e")
    exec "normal! o"
    normal! pzz
    let l:funcitonBegin = search("^    \\(private\\|public\\|protected\\) function", "e")
    exec "normal! wdw"
    startinsert
endfunction

" rename function
function! PhpRenameFunction()
    let l:funcitonBegin = search("^    \\(private\\|public\\|protected\\) function", "be")
    exec "normal! wdw"
    startinsert
endfunction

" delete function
function! PhpDeleteFunction()
    let l:funcitonBegin = search("^    \\(private\\|public\\|protected\\) function", "b")
    normal! V
    let l:funcitonEnd = search("^    }", "e")
    normal! d
endfunction

" append constructor
function! PhpAppendConstructor()
    normal G
    let lastProperty = search("^    \\(private\\|public\\|protected\\) \\$", 'b')
    call PhpInsertFunction('__construct', lastProperty)
endfunction

" change private of function or property
function! PhpChangeVisibility()
    let line = getline('.')
    if stridx(line, 'public') != -1
        silent :s/public/private/g
    elseif stridx(line, 'private') != -1
        silent :s/private/protected/g
    elseif stridx(line, 'protected') != -1
        silent :s/protected/public/g
    endif

    silent! call repeat#set(":call PhpChangeVisibility()\<CR>", v:count)
endfunction

"#####################################
"# HELPERS
"#####################################

" insert function
function! PhpInsertFunction(name, lastFunction)
    if a:lastFunction == 0
        let endOfClass = search("^}")
        exec "normal O\<CR>public function " . a:name . "()\<CR>{\<CR>}"
    else
        exec "normal o\<CR>public function " . a:name . "()\<CR>{\<CR>}"
    endif
    " let functionName = search("public function " . a:name . "()", "e")
endfunction

" init object
function! PhpObject(type)
    let l:file = expand('%:t:r') 
    let l:path = substitute(fnamemodify(expand("%:p:h"), ":~:."), '/', '\', 'g') 

    let l:namespaceBegin = search("^namespace ", "w")

    if l:namespaceBegin == 0
        exec "normal! i<?php\<CR>\<CR>namespace " . l:path . ";\<CR>\<CR>" . a:type . " " . l:file . "\<CR>{\<CR>}"
        let className = search(a:type . " " . file, "e")
    else
        exec "normal! Cnamespace " . path . ";"
        " и сам объект
    endif
endfunction

" insert argument
function! PhpAppendArgument()
    normal! l"pyi)
    let l:arguments = @p

    let l:endBracket = search(")")

    " if has not lines
    if match(l:arguments, "\n") == -1
        " if has arguments
        if len(l:arguments) != 0
            exec "normal! i, "
            exec "normal! l"
        endif
    else
        exec "normal! kA,\<CR> "
    endif
endfunction
