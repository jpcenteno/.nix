" Basic Mappings ===============================================================

nnoremap ; :
vnoremap ; :

let mapleader=" "
let maplocalleader=","

nmap Q @q
vmap Q :norm @q<cr>

" Search =======================================================================

set ignorecase

" UI ===========================================================================

set background=light
let g:one_allow_italics = 1
colorscheme one

hi clear CursorLine
highlight CursorLine gui=underline cterm=underline
set cursorline

" Highlight tabs and trailing spaces.
set list lcs=trail:·,tab:»\ ,extends:▶,precedes:◀

" NERDTree
nnoremap <leader>tt :NERDTreeToggle<CR>
nnoremap <leader>tf :NERDTreeFind<CR>

" CtrlP
let g:ctrlp_map = '<leader>sp'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <leader>sb :CtrlPBuffer<CR>

" Programming ==================================================================

autocmd BufWritePost *.exs,*.ex silent :!mix format %
