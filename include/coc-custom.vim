nmap <silent> GD :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gD :call CocAction('jumpDefinition', 'split')<CR>

nnoremap <silent> <space>tp  :CocCommand translator.popup<CR>
nnoremap <silent> <space>tr  :CocCommand translator.replace<CR>

hi CocUnderline gui=underline term=underline
hi CocErrorHighlight ctermfg=red  guifg=#c4384b gui=underline term=underline
hi CocWarningHighlight ctermfg=yellow guifg=#c4ab39 gui=underline term=underline

" вызов coc-explorer
nmap <silent> <space>e :CocCommand explorer --sources=file+<CR>
nmap <silent> <space><space> :CocCommand explorer --sources=buffer+<CR>

let g:coc_global_extensions = ['coc-cspell-dicts', 'coc-explorer', 'coc-spell-checker', 'coc-translator', 'coc-phpls', 'coc-psalm']

" умное выделение
nmap <silent> <C-space> <Plug>(coc-range-select)
xmap <silent> <C-space> <Plug>(coc-range-select)

" мультикурсор
" hi CocCursorRange guibg=#b16286 guifg=#ebdbb2
" xmap <silent> <C-n> y/\V<C-r>=escape(@",'/\')<CR><CR>gN<Plug>(coc-cursors-range)gn'")
" nmap <expr> <silent> <C-n> <SID>select_current_word()
" function! s:select_current_word()
"   if !get(b:, 'coc_cursors_activated', 0)
"     return "\<Plug>(coc-cursors-word)"
"   endif
"   return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
" endfunc
