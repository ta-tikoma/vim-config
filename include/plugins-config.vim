let g:indentLine_setConceal = 0

" Quick-scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

let g:indentLine_char = '·'

" PHPUnit
let g:phpunit_bin = 'cd devenv && docker-compose exec -T php72 php vendor/phpunit/phpunit/phpunit'
noremap <F10> :PHPUnitRunCurrentFile<CR>

"########################
" EasyAlign
"########################
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"########################
" Easymotion
"########################
nmap s <Plug>(easymotion-overwin-f2)

"########################
" Fugitive
"########################
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

"########################
" FZF
"########################
nmap <Leader>f :FZF<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>
nmap <Leader>g :GFiles?<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-a': 'split',
  \ 'ctrl-s': 'vsplit' }
command! -bang -nargs=+ -complete=dir Rag call fzf#vim#ag_raw(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

"########################
" Floaterm
"########################
let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F12>'
command! CGW FloatermNew cgw

"########################
" STARTIFY
"########################
let g:startify_lists = [
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

let g:startify_relative_path = 1
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 0

