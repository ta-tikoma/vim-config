call plug#begin('~/.config/nvim/plugged')

" THEMES
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/sonokai'

" PLUGINS

" Валидация и помощь по языку
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'dense-analysis/ale'

" Закрыть буфер без закрытия сплита
Plug 'qpkorr/vim-bufkill'

" Быстрый переход
Plug 'unblevable/quick-scope'
Plug 'easymotion/vim-easymotion'

" Плагин для гита
Plug 'tpope/vim-fugitive'

" Плагин по комментариям
Plug 'tomtom/tcomment_vim'

" Для парных скобок
Plug 'jiangmiao/auto-pairs'

" Размеры окон
Plug 'simeji/winresizer'

" Создание своих модов
" Plug 'kana/vim-submode'

" Мультикурсор как в саблайм
Plug 'terryma/vim-multiple-cursors'

Plug 'justinmk/vim-dirvish'

Plug 'tpope/vim-projectionist'

" Повторение операций
Plug 'tpope/vim-repeat'

" Для работы с парными элементами
Plug 'tpope/vim-surround'

" Для вырванивания
Plug 'junegunn/vim-easy-align'

" чтоб выводить вертикальную линию конца строки
Plug 'yggdroot/indentline'

" начальный экран
Plug 'mhinz/vim-startify'

" терминал в окне
Plug 'voldikss/vim-floaterm'

" FZF
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" LIGHTLINE
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
" Plug 'mengelbrecht/lightline-bufferline'

" UTILS
" Plug 'ta-tikoma/phpunit.vim'
" Plug 'diepm/vim-rest-console'

call plug#end()
