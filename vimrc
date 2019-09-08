
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

"----------- Enable ALE plugin and set configs ----------------------------
let g:airline#extensions#ale#enabled = 1

let g:ale_linters = {'ruby': ['standardrb', 'solargraph']}
let g:ale_fixers = {'ruby': ['standardrb']}
let g:ale_lint_delay = 75
let g:ale_sign_column_always = 1

highlight ALEError ctermbg=DarkRed
highlight ALEWarning ctermbg=none cterm=underline

:nnoremap <Leader>f :ALEFix<CR>

"--------------------------------------------------------------------------

"------------- LanguageClient-neovim config for IDE-type features ---------
let g:LanguageClient_autoStart         = 1
let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_serverCommands = {
    \ 'ruby': ['solargraph', 'stdio']
    \ }

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <Leader>k :pclose<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> gi :call LanguageClient_textDocument_implementation()<CR>
nnoremap <silent> gc :call LanguageClient_contextMenu()<CR>
nnoremap <silent> gr :call LanguageClient_textDocument_references()<CR>
nnoremap <Leader>r :lclose<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
"--------------------------------------------------------------------------

let g:deoplete#enable_at_startup = 1

