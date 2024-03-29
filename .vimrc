if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif



call plug#begin()
  Plug 'sheerun/vim-polyglot'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'vimwiki/vimwiki'
  Plug 'huyvohcmc/atlas.vim'
  Plug 'andreasvc/vim-256noir'
call plug#end()

set nocompatible
set autoindent
set autowrite
set number
set ruler
set showmode
set tabstop=2
set modifiable
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
set termguicolors
colorscheme 256_noir

set cursorline
highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212
autocmd InsertEnter * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=234 guifg=NONE guibg=#1c1c1c
autocmd InsertLeave * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212


function! AdjustEOF()
     hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
endfunction

augroup one_colors
    autocmd!
    autocmd ColorScheme 256_noir call AdjustEOF()
augroup END

filetype plugin on
syntax enable

nnoremap confe :e $HOME/.vimrc<CR>
nnoremap confr :source $HOME/.vimrc<CR>
nnoremap <C-f> :Files<CR>
nnoremap <C-i> :bp<CR>
nnoremap <C-o> :bn<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <C-L> :nohl<CR><C-L>
