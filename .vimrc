" Milton's Custom ZSH File
" Updated on 2020, April 9th 
" 11:58pm
" Created In Roni Quarantine Boredom
" ##############################################################################



set nocompatible              
filetype off                 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

set guifont=Fira\ Code:h18
set background=dark
" Vundle Plugin
"-------------------------------
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'tpope/vim-surround'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jiangmiao/auto-pairs'
Plugin 'chiel92/vim-autoformat'
Plugin 'shime/vim-livedown'
Plugin 'preservim/nerdtree'
Plugin 'prettier/prettier'
Plugin 'Yggdroot/indentLine'
Plugin 'mhinz/vim-signify'
Plugin 'lervag/vimtex'
Plugin 'gi1242/vim-tex-autoclose'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'chriskempson/base16-vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'iamcco/mathjax-support-for-mkdp'
Plugin 'iamcco/markdown-preview.vim'
Plugin 'valloric/youcompleteme'
Plugin 'arcticicestudio/nord-vim'
call vundle#end()

" Theme
" --------------------------------
let ayucolor="nord"
syntax on

if (has("autocmd") && !has("gui_running"))
    augroup colors
      autocmd!
      let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16": "7"}

    augroup END
  endif
  colorscheme nord


filetype plugin indent on
autocmd vimenter * if !argc() | NERDTree | endif

highlight Comment cterm=italic gui=italic


"" Markdown
let g:livedown_browser = "chrome"


map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1


let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_setColors = 0
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)
let g:indentLine_bgcolor_term = 202
let g:indentLine_bgcolor_gui = '#FF5F00'
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2


au BufRead,BufNewFile *.md setlocal textwidth=80


" Set Airline bar theme
let g:airline_theme='nord'


" Colour at column 80
set colorcolumn=80

" Maps
" --------------------------------
let g:mapleader = " " " Set leader to spacebar 
set spelllang=en_gb
set backspace=indent,eol,start " Bring backspace to life
set number          " Line numbers
set relativenumber  " Relative line numbers
set hlsearch        " Highlight whole word when searching
set ignorecase      " Ignore case when searching...
set smartcase       " ...except when serach query contains a capital letter
set autoread        " Auto load files if they change on disc
set matchpairs+=<:>
set showmatch
set updatetime=300
set clipboard=unnamed

map <Leader>p :set paste<CR><esc>"*]p:set nopaste<cr>
map <Leader>y "*y  )
map <Leader><Leader> :w<CR>
inoremap jj <ESC>:w<CR>
     
" Pasting - indent last pasted
nnoremap gz '[='] 

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><ESC> :noh<cr>

"Cursor
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Open current file in a new vertical split with '='
nnoremap = :vsplit<cr>

" Easy split navigation
map <C-j> <C-w>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Simplify using tabs
nnoremap ˙ gT
nnoremap ¬ gt
nnoremap T :tabnew<cr>

" Open new splits to right and bottom 
set splitbelow
set splitright

"Tab completion
set wildmenu
set wildmode=list:longest,list:full
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
    endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Tab size
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set nojoinspaces


" Disable swap files
set noswapfile

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Disable arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
