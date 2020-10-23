call plug#begin('~/.vim/plugged')


" Sidebar File Manager ----------------------------------------------------
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
" leader+q for open the file manager
nnoremap <leader>q <cmd>CHADopen<cr>




call plug#end()

" Set Space as leader key
nmap <space> <leader>


