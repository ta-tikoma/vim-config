" lightline
let g:lightline = {
    \ 'colorscheme': 'sonokai',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'readonly', 'filename', 'modified', 'coc_error', 'coc_warning', 'coc_hint', 'coc_info' ] ],
    \   'right': [[ 'gitbranch'], 
    \             [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ]]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'gitbranch#name',
    \ },
    \ 'component_expand': {
    \   'coc_error'        : 'LightlineCocErrors',
    \   'coc_warning'      : 'LightlineCocWarnings',
    \   'coc_info'         : 'LightlineCocInfos',
    \   'coc_hint'         : 'LightlineCocHints',
    \   'coc_fix'          : 'LightlineCocFixes',
    \   'linter_checking'  : 'lightline#ale#checking',
    \   'linter_infos'     : 'lightline#ale#infos',
    \   'linter_warnings'  : 'lightline#ale#warnings',
    \   'linter_errors'    : 'lightline#ale#errors',
    \   'linter_ok'        : 'lightline#ale#ok',
    \ },
    \ 'component_type': {
    \   'coc_error'        : 'error',
    \   'coc_warning'      : 'warning',
    \   'coc_info'         : 'middle',
    \   'coc_hint'         : 'middle',
    \   'coc_fix'          : 'middle',
    \   'linter_errors'    : 'error',
    \   'linter_warnings'  : 'warning',
    \   'linter_infos'     : 'middle',
    \   'linter_checking'  : 'middle',
    \ }
    \ }

" set showtabline=2
" let g:lightline#bufferline#filename_modifier = ':t'
" let g:lightline#bufferline#unnamed      = '[No Name]'
" let g:lightline#bufferline#show_number  = 1
" autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

function! s:lightline_coc_diagnostic(kind) abort
  let info = get(b:, 'coc_diagnostic_info', 0)
  if empty(info) || get(info, a:kind, 0) == 0
    return ''
  endif
  return printf('%s: %d', a:kind, info[a:kind])
endfunction

function! LightlineCocErrors() abort
  return s:lightline_coc_diagnostic('error')
endfunction

function! LightlineCocWarnings() abort
  return s:lightline_coc_diagnostic('warning')
endfunction

function! LightlineCocInfos() abort
  return s:lightline_coc_diagnostic('information')
endfunction

function! LightlineCocHints() abort
  return s:lightline_coc_diagnostic('hint')
endfunction

autocmd User CocDiagnosticChange call lightline#update()
