inoremap <silent> jj <ESC>
syntax on
set number
set backspace=indent,eol,start
set laststatus=2

"インサートモードのままカーソル移動
inoremap <C-f> <C-g>U<Right>
inoremap <C-b> <C-g>U<left>
inoremap <C-f><C-f> <C-g>U<ESC><S-a>
" Set spacebar to <leader>
let mapleader="\<Space>"

" <leader>h  Create 42header
nnoremap <leader>h :Stdheader<CR>

" <leader>$  Remove trailing whitespace
nnoremap <leader>$ :let _s=@/<Bar>:%s/\s\+$//e<Bar> :let @/=_s<Bar><CR>

" Indent
filetype off
filetype plugin indent on
set autoindent
set smartindent

" Tab
set shiftwidth=4
set tabstop=4
set noexpandtab
set list listchars=tab:\▸\-

" Search
set incsearch
set smartcase
set ignorecase
set showmatch
set hlsearch
set t_Co=256
highlight ColorColumn ctermbg=39

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
" Move window
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

" CodeRunner
map <F5> :!clear && gcc % && ./a.out<CR>

" Buffer
set hidden
set noswapfile

" Letter
set enc=utf-8
set encoding=utf-8
set fenc=utf-8
set termencoding=utf-8

" man
runtime! ftplugin/man.vim
