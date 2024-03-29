" Of course we should be improved.
set nocompatible

" Required by Vundle
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage plugins (Vundle itself also)
Plugin 'gmarik/Vundle.vim'
Plugin 'othree/xml.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'kien/ctrlp.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'valloric/MatchTagAlways'
Plugin 'scrooloose/nerdtree'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'majutsushi/tagbar'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

" Map Leader key to <Space>
let mapleader=" "

" Use kj as <Esc> alternative
inoremap kj <Esc>

" Set terminal color to 256 and turn syntax highlighting on
set t_Co=256
syntax on

" Good to have line numbers and cursorline on
set number
set cursorline

" Enable mouse reporting
set mouse=a

" Set encoding to UTF-8
set encoding=utf-8

" Sometimes useful...
set history=700
set undolevels=700

" Default to 4 spaces of auto indentation
set ai
set tabstop=4 shiftwidth=4 softtabstop=4
set expandtab

" Visually differenciate tabs and trailing spaces
set list
set listchars=tab:>-,trail:.,extends:#,nbsp:.

" Respect file header
set modelines=3

" For Makefilels let's use tabs
autocmd FileType make setlocal shiftwidth=4 tabstop=4 softtabstop=4

" Whitespace settings
au FileType c,cpp setlocal tabstop=8 noexpandtab softtabstop=8 shiftwidth=8
au FileType python,javascript setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4
au FileType ruby setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType html,xhtml,xml,yaml,yml,json setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

" About search...
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable swap files for file system watcher
set nobackup
set nowritebackup
set noswapfile

" (Mac) For the delete key to work as backspace
set backspace=indent,eol,start

" Paste and paste and paste... without re-copy
xnoremap p pgvy

" Auto tag completion
autocmd BufWritePre *.html :%s/\s\+$//e

" Git commit message helper
autocmd Filetype gitcommit setlocal spell textwidth=72

" README helper
autocmd BufRead,BufNewFile README.* setlocal spell

" Terminal width
set wrap
set textwidth=79
set formatoptions=qrn1

" Color schemes for different languages
autocmd BufEnter * colorscheme jellybeans
autocmd BufEnter *.py colorscheme jellybeans
autocmd BufEnter *.rb colorscheme codeschool
autocmd BufEnter *.haml colorscheme codeschool

" Highlight the trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Turn on wildmenu
set wildmenu

" Map F7 to vertical splits a new pane for file browsing
nnoremap <F7> :vsplit<CR><C-w>l:e.<CR>

" Easy navigation in splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Protect your fat fingers from the evils of <F1>
noremap <F1> <Esc>

" Easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" Unbind the cursor keys in insert, normal and visual modes.
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor

" Settings for the powerline plugin
set laststatus=2

" Settings for ctrlp plugin
let g:ctrlp_max_height=30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Settings for Nerdtree
map <F3> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" Settings for Tagbar
nmap <F8> :TagbarToggle<CR>
