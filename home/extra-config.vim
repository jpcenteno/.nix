" == Basic Editing =============================================================

set tabstop=4
set shiftwidth=4
set expandtab

" == Basic Mappings ============================================================

nnoremap ; :
vnoremap ; :

let mapleader=" "
let maplocalleader=","

nmap Q @q
vmap Q :norm @q<cr>

nmap Y y$
" Copy to clipboard with <leader>c
nmap <leader>cy "*y
nmap <leader>cY "*y$
vmap <leader>cy "*y
nmap <leader>cp "*p
vmap <leader>cp "*p

set mouse=a

" == Search and navigation =====================================================

set ignorecase

" NERDTree
nnoremap <leader>tt :NERDTreeToggle<CR>
nnoremap <leader>tf :NERDTreeFind<CR>

" fzf
nnoremap <leader>sp :Files<CR>
nnoremap <leader>sb :Buffers<CR>
nnoremap <leader>sr :Rg<CR>

" == UI ========================================================================

colorscheme gruvbox
set bg=dark

hi clear CursorLine
highlight CursorLine gui=underline cterm=underline
set cursorline

" Highlight tabs and trailing spaces.
set list lcs=trail:·,tab:»\ ,extends:▶,precedes:◀

" Line wrapping.
set nowrap

" == Programming ===============================================================

autocmd BufWritePost *.exs,*.ex silent :!mix format %
