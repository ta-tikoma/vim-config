set nospell

set spellfile=~/.config/nvim/spellfiles/en.utf-8.add

let g:spelunker_check_type = 1

" Disable default autogroup. (default: 0)
let g:spelunker_disable_auto_group = 1

augroup spelunker
  autocmd!
  autocmd BufWinEnter,BufWritePost *.vim,*.php,*.cmd,*.bat,*.md call spelunker#check()
augroup END
