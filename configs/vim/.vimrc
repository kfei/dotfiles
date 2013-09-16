set t_Co=256
syntax on

set ai
set tabstop=4
set expandtab

filetype plugin on
filetype indent on

xnoremap p pgvy

autocmd BufWritePre *.html :%s/\s\+$//e
autocmd Filetype gitcommit setlocal spell textwidth=72

" Default color schemes to different languages
autocmd BufEnter * colorscheme jellybeans 
autocmd BufEnter *.py colorscheme jellybeans
