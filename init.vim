" Plugins {{{
call plug#begin()


"Colorschemes
Plug 'joshdick/onedark.vim'

"Syntax
Plug 'sheerun/vim-polyglot'

"Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Linting Engine
Plug 'w0rp/ale'

"Code assists
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'metakirby5/codi.vim'

"Plug 'godlygeek/tabular'
"Plug 'editorconfig/editorconfig-vim'


call plug#end()
"}}}
" Plugin Configs {{{

" --- Airline
"let g:airline_powerline_fonts = 1

" }}}
" Config {{{

set guifont=Consolas

" Colorscheme
set background=dark
colorscheme onedark

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
  autocmd BufWritePost $MYGVIMRC source $MYGVIMRC
augroup END

" terminal auto insert
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
au BufEnter * if &buftype == 'terminal' | :setlocal norelativenumber | :setlocal nonumber | endif

" hybrid line numbers
:set number relativenumber
:augroup numbertoggle
: autocmd!
: autocmd BufEnter,FocusGained,InsertLeave  * set relativenumber
: autocmd BufLeave,FocusLost,InsertEnter    * set norelativenumber
:augroup END


"}}}
" Functions {{{
" }}}


" open folds with <Space>
