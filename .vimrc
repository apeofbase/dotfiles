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

" -Utilities
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'adelarsq/vim-matchit'
Plug 'ervandew/screen'
Plug 'godlygeek/tabular'
Plug 'tomtom/tcomment_vim'
Plug 'bling/vim-airline'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
"Plug 'sjl/vitality.vim' "MacOS only
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'

" -Syntax & Language
Plug 'pangloss/vim-javascript'
Plug 'othree/html5-syntax.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'mxw/vim-jsx'
Plug 'lumiliet/vim-twig'
Plug 'w0rp/ale'
Plug 'styled-components/vim-styled-components'
Plug 'hail2u/vim-css3-syntax'

" -Color
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

"=============================================================================
"
"  PLUGIN SETTINGS
"
"=============================================================================
" ALE settings
"let g:ale_sign_error = '●' " Less aggressive than the default '>>'
"let g:ale_sign_warning = '.'
"let g:ale_lint_on_enter = 0 " Less distracting when opening a new file

" GitGutter https://github.com/airblade/vim-gitgutter
let g:gitgutter_sign_added = '+'
let g:gitgutter_grep = 'rg'

" avoiding annoying CSApprox warning message
"let g:CSApprox_verbose_level = 0

" NERDTree
map <C-b> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Airline settings
let g:airline_symbols = {}
let g:airline_powerline_fonts=0
let g:airline_symbols.linenr = '␤ '
let g:airline_symbols.paste = 'ρ'
let g:airline_section_y = ''
let g:airline_section_z = ''

" Allow gruvbox theme to use italics
"let g:gruvbox_italic=1

" Rg settings
nmap <C-g> :Find<CR>
" :Find use rg; pulled from https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --glob "!node_modules/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" fzf settings
set rtp+=system("which fzf")
nmap ; :Files<CR>
nmap <Leader>t :Tags<CR>
nmap <Leader>b :Buffers<CR>

" Screen settings
let g:ScreenImpl = 'Tmux'
let g:ScreenShellTmuxInitArgs = '-2'
let g:ScreenShellInitialFocus = 'shell'
let g:ScreenShellQuitOnVimExit = 0

" vim-javascript settings
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

" vim-jsx
let g:jsx_ext_required = 0

" Vim-closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx'
