" lightline
let g:lightline = {
    \ 'colorscheme': 'sonokai',
    \ 'active': {
    \   'left':  [[ 'filename', 'modified' ]],
    \   'right': [[ 'gitbranch', 'lineinfo' ],
    \             [ 'coc_error', 'coc_warning', 'coc_hint', 'coc_info' ]]
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
    \ },
    \ 'component_type': {
    \   'coc_error'        : 'error',
    \   'coc_warning'      : 'warning',
    \   'coc_info'         : 'middle',
    \   'coc_hint'         : 'middle',
    \   'coc_fix'          : 'middle',
    \ }
    \ }


function! s:lightline_coc_diagnostic(kind) abort
  let info = get(b:, 'coc_diagnostic_info', 0)
  if empty(info) || get(info, a:kind, 0) == 0
    return ''
  endif
  " return printf('%s: %d', a:kind, info[a:kind])
  return printf('%d', info[a:kind])
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
