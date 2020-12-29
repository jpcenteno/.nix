" Basic Mappings ===============================================================

nnoremap ; :
vnoremap ; :

let mapleader=" "
let maplocalleader=","

nmap Q @q
vmap Q :norm @q<cr>

" UI ===========================================================================

colorscheme gruvbox

hi clear CursorLine
" Highlight tabs and trailing spaces.
set list lcs=trail:·,tab:»\ ,extends:▶,precedes:◀

" NERDTree
nnoremap <leader>tt :NERDTreeToggle<CR>
nnoremap <leader>tf :NERDTreeFind<CR>

" CtrlP
let g:ctrlp_map = '<leader>sp'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <leader>sb :CtrlPBuffer<CR>
