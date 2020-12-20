" function! s:gitStatus()
"     let files = systemlist('git ls-files -m 2>/dev/null')
"     return map(files, "{'line': v:val, 'path': v:val}")
" endfunction

let g:startify_lists = [
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

        " \ { 'type': function('s:gitStatus'),  'header': ['   git status']},

let g:startify_relative_path = 1
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 0
