" Of course we should be improved.
set nocompatible

" Set terminal color to 256 and turn syntax highlighting on
set t_Co=256
syntax on

" Default to 4 spaces of auto indentation
set ai
set tabstop=4 shiftwidth=4 softtabstop=4
set expandtab

filetype plugin on
filetype indent on

" Paste and paste and paste... without re-copy
xnoremap p pgvy

" Auto tag completion
autocmd BufWritePre *.html :%s/\s\+$//e

" Git commit message helper
autocmd Filetype gitcommit setlocal spell textwidth=72

" README helper
autocmd BufRead,BufNewFile README.* setlocal spell textwidth=80

" Default color schemes to different languages
autocmd BufEnter * colorscheme jellybeans 
autocmd BufEnter *.py colorscheme jellybeans
