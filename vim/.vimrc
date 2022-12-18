" Plugin Management
call plug#begin('~/.local/share/vim/plugins')
  Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
  Plug 'ghifarit53/tokyonight-vim'
  Plug 'sheerun/vim-polyglot'
call plug#end()

" Default Vim Config
set nocompatible
set autoindent
set autowrite
set number
set ruler
set showmode
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smartindent
set smarttab
set textwidth=72
set expandtab
set norelativenumber
set nobackup
set noswapfile
set nowritebackup
set icon
set hlsearch
set incsearch
set linebreak
set shortmess=aoOtTI
set viminfo='20,<1000,s1000
set noshowmatch
set wrapscan
set hidden
set history=100
set omnifunc=syntaxcomplete#Complete
set completeopt-=preview
set ttyfast
set wildmenu
set background=dark
set updatetime=100
set termguicolors
filetype plugin on
syntax enable

" Colorscheme
let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1
colorscheme tokyonight

" netrw
let g:netrw_keepdir = 0
let g:netrw_winsize = 15
let g:netrw_localcopydircmd = 'cp -r'
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" Keymaps
nnoremap confe :e $HOME/.vimrc<CR>
nnoremap confr :source $HOME/.vimrc<CR>
nnoremap <C-e> :Lexplore<CR>
nnoremap <C-o> :bp<CR>
nnoremap <C-p> :bn<CR>
nnoremap <C-b> :buffers<CR>:buffer<Space>
nnoremap <C-L> :nohl<CR><C-L>
map <F1> :set cursorline!<CR>

" Golang
let g:go_fmt_command = 'goimports'
let g:go_fmt_autosave = 1
let g:go_gopls_enabled = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_diagnostic_errors = 1
let g:go_highlight_diagnostic_warnings = 1
let g:go_auto_sameids = 0
