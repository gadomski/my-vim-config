" Enable pathogen. Do it. Do it now.
execute pathogen#infect()

" The basics
syntax on
filetype plugin indent on
set laststatus=2
set hlsearch

" Tabs to spaces
set expandtab
set shiftwidth=4
set smarttab
set softtabstop=4
set tabstop=4

" Set up solarized
set background=dark
colorscheme solarized
highlight Normal ctermbg=none

" Force .md to be markdown instead of modula2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Line numbers, doy
set number

" Smart case-sensitivity in searching
set smartcase

" Tab mode in the command bar
set wildmenu

" Load man.vim
runtime! ftplugin/man.vim


"""""""""""""""""
" Plugin zone
"""""""""""""""""

" vim-projectionist
let g:projectionist_heuristics = {
            \ "build/build.ninja": {
            \   "*": {
            \     "make": "ninja\ -C\ build",
            \     "dispatch": "ninja\ -C build && CTEST_OUTPUT_ON_FAILURE=1\ ninja\ -C\ build test"
            \   }
            \ },
            \ "Cargo.toml": {
            \   "*": {
            \     "dispatch": "cargo test --color=never -- --color=never"
            \   }
            \ }
            \ }

" airline
let g:airline#extensions#tabline#enabled = 1

" gitgutter
nmap [h <Plug>GitGutterPrevHunk
nmap ]h <Plug>GitGutterNextHunk

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_checkers = ["clang_check"]
let g:syntastic_cpp_clang_check_post_args = "-p build/compile_commands.json"

" vim-tags
let g:vim_tags_ctags_binary="noglob ctags"
