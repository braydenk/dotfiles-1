let plugins = '~/.config/nvim/plugins'                                  " plugin configuration
if has("win32") | let plugins = "~/AppData/Local/nvim/plugins" | endif  " on windows set plugin dir to the neovim AppData directory

call plug#begin(plugins)
  Plug 'sheerun/vim-polyglot'                                           " better syntax highlighting
  Plug 'martinda/Jenkinsfile-vim-syntax'                                " vim-polyglot groovy syntax is broken
  Plug 'tpope/vim-vinegar'                                              " improved explorer window
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }                   " install the fzf tool (it is not always available from a package manager
  Plug 'junegunn/fzf.vim'                                               " adds fzf support
  Plug 'junegunn/goyo.vim'                                              " adds the option to hide most of the UI for a distraction free mode
  Plug 'junegunn/limelight.vim'                                         " dims the text of any block that is currently not focused
  Plug 'junegunn/seoul256.vim'                                          " adds a low-contrast color scheme
  Plug 'vim-airline/vim-airline'                                        " adds an updated status bar
  Plug 'vim-airline/vim-airline-themes'                                 " adds extended theming for the vim-airline statusbar
  Plug 'osyo-manga/vim-over'                                            " highlight matches to :s or :%s before accepting change
call plug#end()

let mapleader=" "                                                       " set the leader key to ; for easy typing
set tabstop=4 shiftwidth=4 softtabstop=4 smarttab expandtab             " enable smart tabbing
set noerrorbells visualbell t_vb=                                       " disable all bells and whistles
set nobackup nowritebackup noswapfile					                " disable backups and swap files
set lazyredraw ttyfast updatetime=300                                   " make the vim ui a littler snappier on large files and ttys
set encoding=utf-8 termencoding=utf-8                                   " set the default encoding to utf8
set ignorecase smartcase nohlsearch incsearch wildmenu                  " make search a little smarter
let g:fzf_layout = { 'down': '20%' }                                    " set the location and size of the fuzzy finder
let g:goyo_width="85%" | let g:goyo_height="95%"                        " set the default Goyo mode window size
let g:seoul256_background=235                                           " set the default seoul256 background colour a little darker
set termguicolors | colo seoul256 | let g:airline_theme="seoul256"      " set the colorscheme to junegunn/seoul256.vim, also set the status bar theme
set cursorline                                                          " add a current line highlight for the active window

" fix weird error where closing braces sometimes have a red bg.
highlight Error guibg=None ctermbg=None

" remove trailing spaces and newlines on save
autocmd BufWritePre * %s/\s\+$//e

" use jenkins highlighting over polyglot highlighting for groovy files
autocmd BufReadPost,BufNewFile *.groovy set filetype=Jenkinsfile

" Start Limelight when entering Goyo mode
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Plugin Hotkey Settings
nnoremap <C-O> :Files<CR>
nnoremap <C-F> :Rg<CR>
nnoremap <C-R> :OverCommandLine<CR>%s/

" Standard Hotkey Settings
tnoremap <silent> <C-Esc>   <C-\><C-N><CR>
" quick split resizing
nnoremap <C-Left>           :vertical resize -10<CR>
nnoremap <C-Right>          :vertical resize +10<CR>
nnoremap <C-Up>             :resize -10<CR>
nnoremap <C-Down>           :resize +10<CR>
" quicker split focusing
nnoremap <Leader>h          <C-w>h
nnoremap <Leader>j          <C-w>j
nnoremap <Leader>k          <C-w>k
nnoremap <Leader>l          <C-w>l
nnoremap <Leader>r          <C-W>R
nnoremap <Leader>s          :sp<CR>
nnoremap <Leader>v          :vsp<CR>
" quick save and quit commands
nnoremap <Leader>w          :w<CR>
nnoremap <Leader>q          :q<CR>
