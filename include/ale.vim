"########################
" ALE
"########################
let g:ale_completion_enabled = 0
" let g:ale_disable_lsp = 1
let g:ale_php_phpcs_standard = 'PSR2,PSR1'
let g:ale_php_phpcs_use_global = 1
let g:ale_php_psalm_use_global = 1
let g:ale_linters = {'php': ['php', 'phpcs', 'psalm']}
" let g:ale_linters = {'php': ['php', 'phpcs']}
let g:ale_php_phpcbf_standard = 'PSR2,PSR1'
let g:ale_php_phpcbf_use_global = 1
let g:ale_fixers = {'php': ['phpcbf', 'trim_whitespace', 'remove_trailing_lines']}
let g:ale_fix_on_save = 1
