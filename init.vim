" Plugins {{{
call plug#begin()

" --- Filetype ---
"Javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
"Plug 'jelera/vim-javascript-syntax'

" --- Colorscheme ---
Plug 'tomasr/molokai'
Plug 'w0ng/vim-hybrid'
Plug 'brendonrapp/smyck-vim'

" --- Functionality ---
"AutoComplete and Snippets
Plug 'Shougo/deoplete.nvim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'isRuslan/vim-es6'
Plug 'greg-js/vim-react-es6-snippets'

"Document/Project Navigation
Plug 'ctrlpvim/ctrlp.vim'

"Debugging and Syntax Help
Plug 'benekastah/neomake'
"Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

"Visual Aids
Plug 'myusuf3/numbers.vim'
Plug 'bling/vim-airline'

"Coding Assist
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'editorconfig/editorconfig-vim'

call plug#end()
"}}}
" Plugin Configs {{{

" --- Airline
let g:airline_powerline_fonts = 1

" --- CtrlP
let g:ctrlp_custom_ignore = 'node_modules'

" --- Deoplete
let g:deoplete#enable_at_startup = 1
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" --- mxw/vim-jsx
let g:jsx_ext_required = 0

" --- Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_open_list = 2
autocmd! BufWritePost,BufEnter * Neomake

" --- Numbers.vim
let g:numbers_exclude = ['term1', 'term2', 'term3']

" --- Ultisnips
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"


" }}}
" Config {{{

set background=dark
colorscheme hybrid

set hidden

" Dont auto size splits
set noea

" Hot reload save fix
set backupcopy=yes

" Visual
set tabstop=2
set shiftwidth=0
set expandtab

" Persistent undo
set undofile
set undodir=~/.vim/.undo/

set number
set nowrap
set fillchars=vert:\│,fold:-


" }}}
" Mappings {{{

" Easy split window navigation
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Use ; for : and : for ;
nnoremap ; :
vnoremap ; :
nnoremap : ;

" Space to toggle folds
nnoremap <space> za
vnoremap <space> za

" Repeat last macro with Q
nmap Q @@


" --- Leader Keys ---
let mapleader = ","
let maplocalleader = "\\"

" Easy Buffer nav
noremap <leader>bp :bprevious<cr>
noremap <leader>bn :bnext<cr>

" Edit vimrc with ,v
noremap <silent> <leader>v :edit $MYVIMRC<cr>

" Quickly switch to last buffer
nnoremap <leader>, :e#<CR>

" Clear highlight after search
noremap <silent><leader>/ :nohls<CR>

" Format entire file
nmap <leader>fef ggVG=

"}}}
" Auto Commands {{{

augroup filetype_vim
  autocmd!
" folding
  autocmd FileType vim setlocal foldmethod=marker
" source this file on save
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" terminal auto insert
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
au BufEnter * if &buftype == 'terminal' | :setlocal norelativenumber | :setlocal nonumber | endif

"}}}
" Functions {{{
" }}}


" open folds with <Space>
