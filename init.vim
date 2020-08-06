let plugins = '~/.config/nvim/plugins'                                  " plugin configuration
if has("win32") | let plugins = "~/AppData/Local/nvim/plugins" | endif  " on windows set plugin dir to the neovim AppData directory

call plug#begin(plugins)
  Plug 'sheerun/vim-polyglot'                                           " better syntax highlighting
  Plug 'tpope/vim-vinegar'                                              " improved explorer window
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }                   " installs fzf
  Plug 'junegunn/fzf.vim'                                               " adds fzf support
  Plug 'junegunn/goyo.vim'                                              " adds the option to hide most of the UI for a distraction free mode
  Plug 'junegunn/limelight.vim'                                         " dims the text of any block that is currently not focused
  Plug 'junegunn/seoul256.vim'                                          " adds a low-contrast color scheme
call plug#end()

set tabstop=4 shiftwidth=4 softtabstop=4 smarttab expandtab             " enable smart tabbing
let mapleader=";"                                                       " set the leader key to ; for easy typing
autocmd BufWritePre * %s/\s\+$//e                                       " remove trailing spaces and newlines on save
set noerrorbells visualbell t_vb=                                       " disable all bells and whistles
set nobackup nowritebackup noswapfile					                " disable backups and swap files
set lazyredraw ttyfast updatetime=300                                   " make the vim ui a littler snappier on large files and ttys
set encoding=utf-8 termencoding=utf-8                                   " set the default encoding to utf8
set ignorecase smartcase nohlsearch incsearch wildmenu                  " make search a little smarter
let g:goyo_width="85%"                                                  " set the default Goyo mode window size
set termguicolors                                     			        " make sure we use terminal colour settings
colo seoul256                                                           " set the colorscheme to junegunn/seoul256.vim

" Start Limelight when entering Goyo mode
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Plugin Hotkey Settings
" Map fzf search to CTRL P
nnoremap <C-P> :GFiles<Cr>

" Standard Hotkey Settings
tnoremap <silent> <C-Esc>   <C-\><C-N><CR>
" quick split reorganizing
nnoremap <Leader>H          :leftabove vsplit<CR>
nnoremap <Leader>J          :rightbelow split<CR>
nnoremap <Leader>K          :leftabove split<CR>
nnoremap <Leader>L          :rightbelow vsplit<CR>
" quick split resizing
nnoremap <C-Left>           :verticalresize -10<CR>
nnoremap <C-Right>          :verticalresize +10<CR>
nnoremap <C-Up>             :resize -10<CR>
nnoremap <C-Down>           :resize +10<CR>
" quicker split focusing
nnoremap <C-H>              <C-w>h
nnoremap <C-J>              <C-w>j
nnoremap <C-K>              <C-w>k
nnoremap <C-L>              <C-w>l
