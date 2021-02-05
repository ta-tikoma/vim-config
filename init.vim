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
" set smartcase
" set inccommand=nosplit

set ttyfast

" set foldenable
" set foldmethod=manual

" colorscheme onedark
let g:sonokai_style = 'shusia'
let g:sonokai_enable_italic = 1
colorscheme sonokai
" colorscheme atlas


" чтоб табы были пробелами
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
autocmd Filetype yaml setlocal shiftwidth=2

" чтоб при навигации с конца строки перехоодило на новую и обратно
set ww=lh

inoremap <expr> jj php#easy#insert#is() ? '<Esc>':'<Esc>:w<CR>'
" inoremap jj <Esc>
" inoremap jj <Esc>:w<CR>

" навигация по буферам
nmap <C-l> :tabnext<CR>
nmap <C-h> :tabprev<CR>
nmap <C-j> :bprevious<CR>
nmap <C-k> :bnext<CR>
nmap <C-c> :BD<CR>
nmap <C-x> :bd<CR>

" nmap <C-q> :bufdo bd<CR>


" сплиты
nmap <C-s> :vsplit<CR>
nmap <C-a> :split<CR>
set splitright
set splitbelow

" навигация между окнами
nmap <A-k> <C-w>k
nmap <A-j> <C-w>j
nmap <A-h> <C-w>h
nmap <A-l> <C-w>l


" вставить название файла
inoremap <C-f> <C-R>=expand("%:t:r")<CR><Esc>

" удалить вникуда
nnoremap <leader>d "_d
" nmap <silent> <leader>c *Ncgn

" без свопа
set nobackup
set nowritebackup
set nowb
set noswapfile

source ~/.config/nvim/include/coc.vim
source ~/.config/nvim/include/coc-custom.vim
source ~/.config/nvim/include/plugins-config.vim
source ~/.config/nvim/include/lightline.vim
" source ~/.config/nvim/include/windows.vim
" source ~/.config/nvim/include/php.vim
" source ~/.config/nvim/include/ale.vim
" source ~/.config/nvim/include/psalm.vim
