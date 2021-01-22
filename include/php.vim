"#####################################
"# KEYBINDING
"#####################################

nmap <C-p>j :call PhpNext()<CR>
nmap <C-p>k :call PhpPrev()<CR>

nmap <C-p>f :call PhpAppendFunction()<CR>
nmap <C-p>F :call PhpPrependFunction()<CR>
" nmap <C-p>df :call DeleteFunction()<CR>

nmap <C-p>a :call PhpAppendArgument()<CR>
" nmap <C-p>da :call DeleteArgument()<CR>

nmap <C-p>pp :call PhpAppendProperty("private")<CR>
nmap <C-p>p :call PhpAppendProperty("public")<CR>

nmap <C-p>v :call PhpChangeVisibility()<CR>

nmap <C-p>ic :call PhpClass()<CR>
nmap <C-p>iac :call PhpAbstractClass()<CR>
nmap <C-p>ii :call PhpInterface()<CR>
nmap <C-p>in :call PhpNamespace()<CR>

nmap <C-p>l :call PhpLog()<CR>

"#####################################
"# FUNCTIONS
"#####################################

" go to prev end or begin function and class properties
function! PhpPrev()
    silent ?^    p
    silent! call repeat#set(":call PhpPrev()\<CR>", v:count)
endfunction

" got to next end or begin function and class properties
function! PhpNext()
    silent /^    p
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

" append property
function! PhpAppendProperty(visibility)
    call inputsave()
    let typeAndName = input("{type} {property name}: ")
    call inputrestore()
    if strlen(typeAndName) == 0
        return
    endif
    let typeAndNameList = split(typeAndName)
    normal G
    let lastProperty = search("^    \\(private\\|public\\|protected\\) \\$", 'b')
    if lastProperty == 0
        let beginOfClass = search("^{")
        exec "normal! o/**\<CR>@var " . typeAndNameList[0] . "\<CR>/\<CR>" . a:visibility . " $" . typeAndNameList[1] . ";"
    else
        exec "normal! o\<CR>/**\<CR>@var " . typeAndNameList[0] . "\<CR>/\<CR>" . a:visibility . " $" . typeAndNameList[1] . ";"
    endif
    " let propertyDoc = search("@var ", "be")
    " call inputsave()
    " startinsert!
endfunction

" append argument
function! PhpAppendArgument()
    call inputsave()
    let typeAndName = input("{type} {argument name}: ")
    call inputrestore()
    if strlen(typeAndName) == 0
        return
    endif
    let typeAndNameList = split(typeAndName)
    let functionBegin = search("function \\w\\+(", 'be')
    let closeBrackets = search(")")
    if functionBegin == closeBrackets
        exec "normal! i" . typeAndNameList[0] . " $" . typeAndNameList[1]
    else
        exec "normal! i, " . typeAndNameList[0] . " $" . typeAndNameList[1]
    endif
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

" append constructor
function! PhpAppendConstructor()
    normal G
    let lastProperty = search("^    \\(private\\|public\\|protected\\) \\$", 'b')
    call PhpInsertFunction('__constract', lastProperty)
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
    let file = expand('%:t:r') 
    let path = substitute(fnamemodify(expand("%:p:h"), ":~:."), '/', '\', 'g') 
    exec "normal! i<?php\<CR>\<CR>namespace " . path . ";\<CR>\<CR>" . a:type . " " . file . "\<CR>{\<CR>}"
    let className = search(a:type . " " . file, "e")
endfunction
