call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'cespare/vim-toml'
Plug 'kana/vim-operator-user'
Plug 'neomake/neomake'
Plug 'racer-rust/vim-racer'
Plug 'rhysd/vim-clang-format'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

syntax enable
set background=dark
colorscheme solarized

let mapleader = '\<Space>'

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set number
set relativenumber

" neomake
autocmd! BufWritePost * Neomake

" rust.vim
let g:rustfmt_autosave = 1

" vim-airline
let g:airline#extensions#tabline#enabled = 1

" vim-airline-themes
let g:airline_theme = 'solarized'

" vim-clang-format
let g:clang_format#auto_format = 1
