" Plugins {{{
call plug#begin()

" --- Filetype ---
"Javascript
Plug 'pangloss/vim-javascript'

" --- Colorscheme ---
Plug 'tomasr/molokai'
Plug 'brendonrapp/smyck-vim'

" --- Functionality ---
"AutoComplete and Snippets
Plug 'Shougo/deoplete.nvim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"Document/Project Navigation
Plug 'ctrlpvim/ctrlp.vim'

"Debugging and Syntax Help
Plug 'benekastah/neomake'

"Visual Aids
Plug 'myusuf3/numbers.vim'
Plug 'bling/vim-airline'

"Coding Assist
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'

call plug#end()
"}}}
" Plugin Configs {{{

" --- Airline
let g:airline_powerline_fonts = 1

" --- Deoplete
let g:deoplete#enable_at_startup = 1


" }}}
" Config {{{

colorscheme molokai

set hidden

" Dont auto size splits
set noea

" Visual
set tabstop=4 
set softtabstop=4
set shiftwidth=4

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

" Use ; for :
nnoremap ; :
vnoremap ; :
nnoremap : ;

" Space to toggle folds
nnoremap <space> za
vnoremap <space> za

" Repeat last macro with Q
nmap Q @@

" ---
" --- Leader Keys ---
" ---
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
	autocmd FileType vim setlocal foldmethod=marker
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

au BufEnter * if &buftype == 'terminal' | :startinsert | endif
"}}}
" Functions {{{
" }}}
