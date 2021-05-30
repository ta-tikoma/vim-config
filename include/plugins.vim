call plug#begin('~/.config/nvim/plugged')

" THEMES
" Plug 'joshdick/onedark.vim'
" Plug 'sainnhe/sonokai'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'

" PLUGINS

" Валидация и помощь по языку
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'sheerun/vim-polyglot'

" Закрыть буфер без закрытия сплита
Plug 'qpkorr/vim-bufkill'

" Быстрый переход
" Plug 'unblevable/quick-scope'
Plug 'easymotion/vim-easymotion'

" Плагин для гита
Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'

" Плагин по комментариям
Plug 'tomtom/tcomment_vim'

" Для парных скобок
Plug 'jiangmiao/auto-pairs'

" Размеры окон
" Plug 'simeji/winresizer'

" Создание своих модов
" Plug 'kana/vim-submode'

" Мультикурсор как в саблайм
" Plug 'terryma/vim-multiple-cursors'

" Навигация по маскам по проекту
" Plug 'tpope/vim-projectionist'

" Эксплорер
" Plug 'justinmk/vim-dirvish'
" Plug 'roginfarrer/vim-dirvish-dovish', {'branch': 'main'}
" Plug 'fsharpasharp/vim-dirvinist'

" Повторение операций
" Plug 'tpope/vim-repeat'

" Для работы с парными элементами
Plug 'tpope/vim-surround'

" Для вырванивания
Plug 'junegunn/vim-easy-align'

" чтоб выводить вертикальную линию конца строки
" Plug 'yggdroot/indentline'

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
" Plug 'romgrk/barbar.nvim'

" Plug 'dominikduda/vim_current_word'

" UTILS
" Plug 'ta-tikoma/phpunit.vim'
" Plug 'diepm/vim-rest-console'
Plug 'fmoralesc/vim-pad'

Plug 'ta-tikoma/php.easy.vim'

call plug#end()
