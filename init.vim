call plug#begin('~/.vim/plugged')
" --------------------------------------------------------------------------

" Colorscheme -----------------------------------------------------------
Plug 'hzchirs/vim-material'
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

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

" Set the code action for CoC - for spell checker
nmap <leader>a  <Plug>(coc-codeaction)

" Code Formattter for other languages: Rust -----------------------------------
Plug 'sbdchd/neoformat'
" use fortmatprg as formatter
let g:neoformat_try_formatprg = 1

" auto save
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END


" TypeScript and JavaScript ---------------------------------------------------
Plug 'pangloss/vim-javascript'         " JavaScript support
Plug 'peitalin/vim-jsx-typescript'     " TypeScript support
Plug 'maxmellon/vim-jsx-pretty'        " JS,JSX syntax
Plug 'leafgarland/typescript-vim'      " TS, TSx syntax


" Status/ Tabline Bottom -------------------------------------------------------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" air-line
let g:airline_powerline_fonts = 1      " Use Powerline font
let g:airline_theme='cobalt2'          " Set Cobalt 2 Theme

if !exists('g:airline_symbols')        " Reset the symbol
    let g:airline_symbols = {}
endif


"--------------------------------------------------------------------------


call plug#end()


" Set Space as leader key
nmap <space> <leader>


" Indentation Options
set expandtab                  " convert tabs to spaces
filetype plugin indent on      " Enable indentation rules that are file-type specific
set tabstop=4                  " Indent using four spaces
set autoindent                 " New lines inherit the indentation of previous lines


" Text Rendering Options
syntax enable                  " Enable syntax hightlighting
set wrap                       " Enable line wrapping
set linebreak                  " Avoid wrapping a line in the middle of a word
set encoding=utf-8             " Use an encoding that supports unicode
set scrolloff=5                " The number of screen lines to keep above and below the cursor
set updatetime=300             " Longer updatetime


" User Interface Options
set mouse=a                    " Enable mouse usage (all modes)
set number                     " Show line numbers on the sidebar
set ruler                      " Always show cursor position - bottom right
set signcolumn=auto:1
highlight clear SignColumn     " Remove the gray area (sign column)

" Code Folding Options
set foldmethod=indent          " Fold based on indentition levels
set foldnestmax=3              " Fold up to three nested levels


" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup


" Normal mode non-recursive mapping
" Go to the beginning of line
nnoremap B ^
" Go to the end of line
nnoremap E $
" Delete to the end of line
nnoremap D d$
" Copy the text from the cursor pos to the end of line
nnoremap Y yy
" Open All Fold
nnoremap <leader>, zR<CR>
" Close all Fold
nnoremap <leader>. zM<CR>
" Quick save (if modified) and quit
nnoremap <leader>w :w<CR>
" Quick save
nnoremap <leader>x :x<CR>


" Colorscheme and True Colors
let g:material_terminal_italics = 1
let g:material_theme_style = 'palenight'
colorscheme material
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
set termguicolors
