
"----- Initial config ---------------------------------------------------
set nocompatible

set tabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start
set cmdheight=2

set updatetime=300

set signcolumn=yes

set hidden

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

nnoremap <silent> <space>p  :<C-u>CocList -A --normal yank<cr>
"------------------------------------------------------------------------

"----- Plugin initialization --------------------------------------------

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'moll/vim-bbye'
Plug 'vim-airline/vim-airline'
Plug 'vim-ruby/vim-ruby'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim' 
Plug 'peitalin/vim-jsx-typescript'
Plug 'mxw/vim-jsx'

call plug#end()

"------------------------------------------------------------------------

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

"---------- Enable shortcuts to close and switch between buffers ----------
:nnoremap <Leader>q :Bdelete<CR>
:nnoremap <Leader>n :bn<CR>
:nnoremap <Leader>p :bp<CR>

"----------- Enable ALE plugin and set configs ----------------------------
"let g:airline#extensions#ale#enabled = 1
"
"let g:ale_linters = {'ruby': ['standardrb', 'solargraph']}
"let g:ale_fixers = {'ruby': ['standardrb']}
"let g:ale_lint_delay = 75
"let g:ale_sign_column_always = 1
"let g:ale_set_highlights = 0
"
"highlight ALEError ctermbg=DarkRed
"highlight ALEWarning ctermbg=none cterm=underline
"
":nnoremap <Leader>f :ALEFix<CR>
"
""--------------------------------------------------------------------------
"
""------------- LanguageClient-neovim config for IDE-type features ---------
"let g:LanguageClient_autoStart         = 1
"let g:LanguageClient_diagnosticsEnable = 0
"let g:LanguageClient_serverCommands = {
"    \ 'ruby': ['solargraph', 'stdio']
"    \ }
"
"nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
"nnoremap <Leader>k :pclose<CR>
"nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
"nnoremap <silent> gi :call LanguageClient_textDocument_implementation()<CR>
"nnoremap <silent> gc :call LanguageClient_contextMenu()<CR>
"nnoremap <silent> gr :call LanguageClient_textDocument_references()<CR>
"nnoremap <Leader>r :lclose<CR>
"nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
""--------------------------------------------------------------------------
"
"set cmdheight=2
"let g:echodoc_enable_at_startup = 1
"let g:echodoc#type = 'signature'
"
"let g:deoplete#enable_at_startup = 1
"" Only use langeclient completion souce
"call deoplete#custom#option('sources', {
"\ '_': ['LanguageClient', 'file', 'member'],
"\})

