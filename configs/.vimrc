set t_Co=256

set ai
set tabstop=4
set expandtab

filetype plugin on
filetype indent on

xnoremap p pgvy

autocmd BufWritePre *.html :%s/\s\+$//e
autocmd Filetype gitcommit setlocal spell textwidth=72

