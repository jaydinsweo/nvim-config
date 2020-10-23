call plug#begin('~/.vim/plugged')
" --------------------------------------------------------------------------


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

" Git Wrapper for Vim ------------------------------------------------------
Plug 'tpope/vim-fugitive'

" Quick Surrounding Tags ----------------------------------------------------
Plug 'tpope/vim-surround'

" CoC completion with LSP suppport -------------------------------------------
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
" install global extensions and language client
let g:coc_global_extensions = ['coc-json', 'coc-prettier', 'coc-tsserver', 'coc-eslint', 'coc-rust-analyzer', 'coc-spell-checker', 'coc-tailwindcss', 'coc-yaml']

" Code Formattter for other languages: Rust ------------------------------------------------
Plug 'sbdchd/neoformat'
" use fortmatprg as formatter
let g:neoformat_try_formatprg = 1
" auto save 
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

" TypeScript and TSX support ---------------------------------------------------------------
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" --------------------------------------------------------------------------
call plug#end()

" Set Space as leader key
nmap <space> <leader>


