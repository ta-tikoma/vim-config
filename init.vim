source ~/.config/nvim/include/plugins.vim

let mapleader=","

set clipboard=unnamedplus
" set number relativenumber
" подстветка синтаксиса
" syntax enable
set termguicolors
" set t_Co=256
" подсветка стоки с курсором
set cursorline
" set guicursor=n-v-c-sm:ver26-blinkon0,i-ci-ve:ver25,r-cr-o:hor20
set colorcolumn=80

" set title
" set titlestring=%F

" кодировка
set encoding=utf-8
set fileencoding=utf-8
set ff=unix

" поиск
set hlsearch
set incsearch
" set inccommand=nosplit

set ttyfast

" set foldenable
" set foldmethod=manual

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

" навигация по буферам
nmap <C-k> :bprevious<CR>
nmap <C-j> :bnext<CR>
nmap <C-c> :BD<CR>

nmap <C-l> :tabnext<CR>
nmap <C-h> :tabprev<CR>

" сплиты
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
nmap <silent> <leader>c *Ncgn

" без свопа
set nobackup
set nowritebackup
set nowb
set noswapfile

source ~/.config/nvim/include/coc.vim
source ~/.config/nvim/include/coc-custom.vim
source ~/.config/nvim/include/plugins-config.vim
source ~/.config/nvim/include/lightline.vim
source ~/.config/nvim/include/php.vim
" source ~/.config/nvim/include/ale.vim
source ~/.config/nvim/include/psalm.vim
