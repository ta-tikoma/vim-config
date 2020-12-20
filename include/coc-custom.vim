nmap <silent> GD :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gD :call CocAction('jumpDefinition', 'split')<CR>

nnoremap <silent> <space>tp  :CocCommand translator.popup<CR>
nnoremap <silent> <space>tr  :CocCommand translator.replace<CR>

hi CocUnderline gui=underline term=underline
hi CocErrorHighlight ctermfg=red  guifg=#c4384b gui=underline term=underline
hi CocWarningHighlight ctermfg=yellow guifg=#c4ab39 gui=underline term=underline

nmap <space>e :CocCommand explorer<CR>
nmap <space>b :CocCommand explorer
            \ --sources=buffer+
            \<CR>
