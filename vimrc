
set nocompatible
syntax on

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

set hidden

execute pathogen#infect()

if has("autocmd")
    augroup templates
        autocmd BufNewFile main.cpp 0r ~/.vim/templates/main_cpp.template
    augroup END

    autocmd vimenter * NERDTreeVCS
endif

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Enable shortcuts to close and switch between buffers
:nnoremap <Leader>q :Bdelete<CR>
:nnoremap <Leader>n :bn<CR>
:nnoremap <Leader>p :bp<CR>

" Enable ALE plugin
let g:airline#extensions#ale#enabled = 1

let g:ale_linters = {'ruby': ['standardrb']}
let g:ale_fixers = {'ruby': ['standardrb']}
let g:ale_lint_delay = 75

highlight ALEError ctermbg=DarkRed
highlight ALEWarning ctermbg=none cterm=underline
