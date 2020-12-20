source ~/.config/nvim/include/plugins.vim

let mapleader=","

" set clipboard=unnamedplus
set number relativenumber
" подстветка синтаксиса
syntax enable
set termguicolors
" set t_Co=256
" подсветка стоки с курсором
set cursorline
" set guicursor=n-v-c-sm:ver26-blinkon0,i-ci-ve:ver25,r-cr-o:hor20
let g:indentLine_setConceal = 0
set colorcolumn=80

set title
set titlestring=%F

" кодировка
set encoding=utf-8
set fileencoding=utf-8
set ff=unix

" поиск
set hlsearch
set incsearch
set inccommand=nosplit

set ttyfast

set foldenable
set foldmethod=manual

" colorscheme onedark
let g:sonokai_style = 'shusia'
let g:sonokai_enable_italic = 1
colorscheme sonokai


" чтоб табы были пробелами
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
autocmd Filetype yaml setlocal shiftwidth=2

" чтоб при навигации с конца строки перехоодило на новую и обратно
set ww=lh

inoremap jj <Esc>:w<CR>

nmap <leader>c *Ncgn

" навигация по буферам
nmap <C-k> :bprevious<CR>
nmap <C-j> :bnext<CR>
nmap <C-c> :BD<CR>

nmap <C-l> :tabnext<CR>
nmap <C-h> :tabprev<CR>

"" Mappings"" Split
nmap <C-a> :split<CR>
nmap <C-s> :vsplit<CR>

" навигация по окнам
set splitbelow
set splitright
map <A-k> <C-w><Up>
map <A-j> <C-w><Down>
map <A-h> <C-w><Left>
map <A-l> <C-w><Right>

" вставить название файла
inoremap <C-f> <C-R>=expand("%:t:r")<CR><Esc>

" удалить вникуда
nnoremap <leader>d "_d

" без свопа
set nobackup
set nowritebackup
set nowb
set noswapfile

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" easymotion
nmap s <Plug>(easymotion-overwin-f2)

" quick-scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

let g:indentLine_char = '·'

let g:phpunit_bin = 'cd devenv && docker-compose exec -T php72 php vendor/phpunit/phpunit/phpunit'
noremap <F10> :PHPUnitRunCurrentFile<CR>

" source ~/.config/nvim/include/coc-old.vim
source ~/.config/nvim/include/coc.vim
source ~/.config/nvim/include/coc-custom.vim

source ~/.config/nvim/include/ale.vim
source ~/.config/nvim/include/fzf.vim
source ~/.config/nvim/include/lightline.vim
source ~/.config/nvim/include/spelunker.vim
source ~/.config/nvim/include/startify.vim
source ~/.config/nvim/include/floaterm.vim
source ~/.config/nvim/include/fugitive.vim
