call plug#begin(plugins)
  Plug 'sheerun/vim-polyglot'                                           " better syntax highlighting
  Plug 'tpope/vim-vinegar'                                              " improved explorer window
  Plug 'morhetz/gruvbox'                                                " nice colors
  Plug 'frazrepo/vim-rainbow'                                           " rainbow braces for lisps
  Plug 'neoclide/coc.nvim', {'branch': 'release'}                       " auto completion engine
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }                   " installs fzf
  Plug 'junegunn/fzf.vim'                                               " adds fzf support
call plug#end()

set tabstop=4 shiftwidth=4 softtabstop=4 smarttab expandtab             " enable smart tabbing
let mapleader=";"                                                       " set the leader key to ; for easy typing
autocmd BufWritePre * %s/\s\+$//e                                       " remove trailing spaces and newlines on save
set noerrorbells visualbell t_vb=                                       " Disable all bells and whistles
let plugins = '~/.config/nvim/plugins'                                  " plugin configuration
if has("win32") | let plugins = "~/AppData/Local/nvim/plugins" | endif  " on windows set plugin dir to the neovim AppData
let g:rainbow_active = 1                                                " rainbow braces settings
set termguicolors background=dark                                       " theme settings for gruvbox
colorscheme gruvbox

" hotkey settings
tnoremap <silent> <Esc> <C-\><C-n>:noh<cr>

" flip buffers
map <Leader>f :e#<CR>

" move split
nnoremap <Leader>H :leftabove vsplit<cr>
nnoremap <Leader>J :rightbelow split<cr>
nnoremap <Leader>K :leftabove split<cr>
nnoremap <Leader>L :rightbelow vsplit<cr>

" move between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
