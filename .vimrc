set nocompatible
filetype on

"=============================================================================
"
"  PLUGINS
"
"=============================================================================

" Load vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if has('nvim')
  if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
endif

call plug#begin('~/.config/vim/plugged')

" -Color
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'mhartington/oceanic-next'

call plug#end()

" Turn on syntax highlighting
syntax on

" Color schemes
set t_Co=256
if has('gui_running')
  set background=dark
  colorscheme gruvbox
elseif has('nvim') 

  " Only works well with certain colorschemes like gruvbox
  set termguicolors
  colorscheme OceanicNext
  set background=dark

  " Sets bg to transparent to use terminal background color
  hi Normal guibg=NONE ctermbg=NONE

else
  colorscheme badwolf
endif

if has("autocmd")

  " Check to see if filetype was automagically identified by Vim
  if exists("did_load_filetype")
    finish
  else
    augroup filetypedetect
      au! BufRead,BufNewFile *.m setfiletype objc
    augroup end
  endif

  " Alternate syntax highlights and indentation
  au BufRead,BufNewFile *.vue set filetype=vue syntax=html
  au BufRead,BufNewFile *.scss,*.css set filetype=sass
  au FileType c,cpp,objc set tabstop=4 shiftwidth=4 softtabstop=4
  autocmd BufRead,BufNewFile *.theme,*.module,*.install,*.test,*.inc,*.view 
        \ set filetype=php

endif

"=============================================================================
"
"  GENERAL SETTINGS
"
"=============================================================================

" Turn on number lines
set number

" Enable filetypes
filetype on
filetype indent on
filetype plugin indent on
filetype plugin on

" Set tab/indention settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smartindent
set autoindent
set expandtab

set listchars=tab:▸\ ,eol:¬

" Minimum window width/height
set winwidth=84
set winheight=24

"Show line and column info
set ruler

"Show 80 character line
set colorcolumn=80

" Turn on Omni completion
set omnifunc=syntaxcomplete#Complete

" Look for and call vim commands within first 5 lines of a doc
" set modeline
set modelines=5

set wildmenu
set wildmode=longest,list

set cursorline

" Copy to system clipboard
"set clipboard=unnamed

let mapleader=","

" Fixes lines with odd number of indents
set shiftround

" Case insensitive search
set ignorecase
set smartcase

" Session settings
set sessionoptions=resize,winpos,winsize,curdir

" Turn on code folding
set foldenable

" To show status bar
set laststatus=2

" Turn off toolbars
if has("gui_running")
	set guioptions=aiA
endif 

" Set update time from default 4000ms
set updatetime=100

"=============================================================================
"
"  KEY BINDS
"
"=============================================================================

" Saves time; maps the spacebar to colon
nmap <space> :

" Omni completion
imap <C-space> <C-X><C-O>

" Map escape key to jj
imap jj <esc>

" Split navigation
" NOTE: If using NeoVim see URL below for <C-h> bind issues
" https://github.com/neovim/neovim/issues/2048#issuecomment-98307896
nmap <C-h> <C-W><C-H>
nmap <C-j> <C-W><C-J>
nmap <C-k> <C-W><C-K>
nmap <C-l> <C-W><C-L>

" Buffer cycling
nmap <A-S-h> :bprevious<CR>
nmap <A-S-l> :bnext<CR>

" Allow to Tab and S-Tab on highlighted text
vnoremap <tab> >`<V`>
vnoremap <s-tab> <`<V`>

" Stop that stupid window from popping up 
" @URL (http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/)
map q: :q
