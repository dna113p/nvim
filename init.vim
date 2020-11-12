"            __  _               ____                __
"       ____/ / (_)  ____  ___  / / /___ _____  ____/ /
"      / __  / / /  / __ \/ _ \/ / / __ `/ __ \/ __  /
"     / /_/ / / /  / /_/ /  __/ / / /_/ / / / / /_/ /
"     \__,_/_/ /  / .___/\___/_/_/\__,_/_/ /_/\__,_/
"         /___/  /_/
"
" Plugins {{{
call plug#begin()

Plug 'joshdick/onedark.vim'
Plug 'w0ng/vim-hybrid'
Plug 'rakr/vim-one'

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'

Plug 'chaoren/vim-wordmotion'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'

"Plug 'editorconfig/editorconfig-vim'

Plug 'bfredl/nvim-ipy'

call plug#end()
"}}}

" Mappings {{{

" --- Leader Keys ---
let mapleader = ","
let maplocalleader = "\\"

" Edit vimrc with ,v
noremap <silent><leader>v :edit $MYVIMRC<cr>

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

" Easy Buffer nav
noremap <leader>bp :bprevious<cr>
noremap <leader>bn :bnext<cr>

" Quickly switch to last buffer
nnoremap <leader>, :e#<CR>

" Clear highlight after search
noremap <silent><leader>/ :nohls<CR>

" Format entire file
nmap <leader>fef ggVG=

" Add numbered movements to jumplist
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'

"}}}

" Config {{{
set hidden
set cmdheight=2
set updatetime=300
set ignorecase
set shortmess+=c
set termguicolors

" Colorscheme
colorscheme onedark
set background=dark

" Left Gutter
set signcolumn=yes

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

if has('win32')
  set shell=powershell.exe shellquote=\" shellpipe=\| shellxquote=
  set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned\ -Command
  set shellredir=\|\ Out-File\ -Encoding\ UTF8
endif

" }}}

" Plugin Configs {{{

" --- Commentary
nmap <C-_> gccj
imap <C-_> <Esc>gcci
vmap <C-_> gc


" --- Airline
let g:airline_powerline_fonts = 1
let g:one_allow_italics = 1
let g:airline_theme="onedark"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'


" --- FZF.vim
nnoremap <C-p> :FZF<cr>
autocmd FileType fzf :tnoremap <buffer> <C-h> <C-h>
autocmd FileType fzf :tnoremap <buffer> <C-j> <C-j>
autocmd FileType fzf :tnoremap <buffer> <C-k> <C-k>
autocmd FileType fzf :tnoremap <buffer> <C-l> <C-l>


" --- Coc.nvim
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Tab trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

let g:coc_snippet_next = '<tab>'

inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

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



" }}}

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
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave  * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter    * set norelativenumber
augroup END

" Allow stylesheets to autocomplete hyphenated words
autocmd FileType css,scss,sass setlocal iskeyword+=-

"}}}

" Functions {{{
" }}}



" Open folds with <Space>
