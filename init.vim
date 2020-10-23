call plug#begin('~/.vim/plugged')


" Sidebar File Manager ----------------------------------------------------
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
" leader+q for open the file manager
nnoremap <leader>q <cmd>CHADopen<cr>

" Command Line Fuzzy Finder -----------------------------------------------
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" leader+f for opens files
nnoremap <silent> <leader>f :Files<CR>
nmap <leader>c :Commits<CR>
nmap <leader>cb : BCommits<CR>
nmap <leader>g :GFiles?<CR>

" Git Wrapper for Vim -----------------------------------------------
Plug 'tpope/vim-fugitive'

call plug#end()

" Set Space as leader key
nmap <space> <leader>


