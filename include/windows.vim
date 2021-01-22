function! MoveOrSplitToUp()
    let oldWindow = winnr()
    wincmd k
    let newWindow = winnr()
    if oldWindow == newWindow
        set nosplitbelow
        split
    endif
endfunction

function! MoveOrSplitToDown()
    let oldWindow = winnr()
    wincmd j
    let newWindow = winnr()
    if oldWindow == newWindow
        set splitbelow
        split
    endif
endfunction

function! MoveOrSplitToRight()
    let oldWindow = winnr()
    wincmd l
    let newWindow = winnr()
    if oldWindow == newWindow
        set splitright
        vsplit
    endif
endfunction

function! MoveOrSplitToLeft()
    let oldWindow = winnr()
    wincmd h
    let newWindow = winnr()
    if oldWindow == newWindow
        set nosplitright
        vsplit
    endif
endfunction

nmap <C-k> :call MoveOrSplitToUp()<CR>
nmap <C-j> :call MoveOrSplitToDown()<CR>
nmap <C-h> :call MoveOrSplitToLeft()<CR>
nmap <C-l> :call MoveOrSplitToRight()<CR>
