
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

" Enable the list of buffers
let g:airline#extensions#coc#enabled = 1

"---------- Enable shortcuts to close and switch between buffers ----------
:nnoremap <Leader>q :Bdelete<CR>
:nnoremap <Leader>n :bn<CR>
:nnoremap <Leader>p :bp<CR>

