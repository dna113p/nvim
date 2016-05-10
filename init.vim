" Plugins {{{
call plug#begin()

" --- Filetype ---
"Javascript
Plug 'pangloss/vim-javascript'
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

" Visual
set tabstop=4
set shiftwidth=4
set expandtab

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

" folding
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" terminal auto insert
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
au BufEnter * if &buftype == 'terminal' | :setlocal norelativenumber | :setlocal nonumber | endif

"}}}
" Functions {{{

"Launch a workspace with terminals
function! Workspace()
    :set splitright
    :let width = winwidth(0)
    :let splitwidth = float2nr(round(width-width*0.618))
    :execute splitwidth . 'vsplit'
    :term
    :silent file term1
    :let height = winheight(0)
    :let splitwidth = float2nr(round(height/3))
    :execute splitwidth . 'split'
    :term
    :silent file term3
    :wincmd j
    :execute splitwidth . 'split'
    :term
    :silent file term2
    :wincmd h
    :stopi
endfunction

" }}}
