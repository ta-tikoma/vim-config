"" statusline
set laststatus=2
set statusline=                          
set statusline+=%2*\                     
" set statusline+=%2*\%{StatuslineMode()}
" set statusline+=%2*\   
set statusline+=%1*\%t
set statusline+=%3*\%h%m%r               
set statusline+=%=                       
set statusline+=%*
set statusline+=%2*\                     
set statusline+=%2*\%{g:gitbranch}
set statusline+=%2*\  
" set statusline+=%2*\  
" set statusline+=%3*\%l/%L\               

"" statusline functions
function! StatuslineMode()
    let l:mode=mode()
    if l:mode==#"n"
        return "NORMAL"
    elseif l:mode==?"v"
        return "VISUAL"
    elseif l:mode==#"i"
        return "INSERT"
    elseif l:mode==#"R"
        return "REPLACE"
    endif
    return "COMMAND"
endfunction

function! StatuslineFileIcon()
  let b:fileicon=WebDevIconsGetFileTypeSymbol(expand("%:p"))
endfunction

function! StatuslineCoc()
  let b:cocstatus=""

  let info = get(b:, 'coc_diagnostic_info', 0)
  if empty(info)
      return
  endif

  let l:cocstatus=""
  if get(info, 'error', 0) != 0
      let l:cocstatus.=" ".info['error']
  endif

  let b:cocstatus=l:cocstatus
endfunction

function! StatuslineGitBranch()
  let g:gitbranch=""
  if &modifiable
    lcd %:p:h
    let l:gitrevparse=system("git rev-parse --abbrev-ref HEAD")
    lcd -
    if l:gitrevparse!~"fatal: not a git repository"
      let g:gitbranch=" ".substitute(l:gitrevparse, '\n', '', 'g')
    endif
  endif
endfunction

augroup StatusLineGroup
  autocmd!
  autocmd VimEnter * call StatuslineGitBranch()
  " autocmd VimEnter,WinEnter,BufEnter * call StatuslineCoc()
  " autocmd VimEnter,WinEnter,BufEnter * call StatuslineFileIcon()
  " autocmd User CocDiagnosticChange call StatuslineCoc()
augroup END
