" Milton's Custom ZSH File
" Updated on 2020, April 9th 
" 11:58pm
" Created In Roni Quarantine Boredom
“ Edited September 27th, 2022
" ##############################################################################


" Theme
" ##############################################################################
let ayucolor="nord"
colorscheme nord
" ##############################################################################

“Set’s
" ##############################################################################
syntax on
set nocompatible              
filetype off                 
setlocal spell
set guifont=Fira\ Code:h18
set background=dark
set rtp+=~/.vim/bundle/Vundle.vim
set spelllang=en_gb
set backspace=indent,eol,start " Bring backspace to life
set number          " Line numbers
set hlsearch        " Highlight whole word when searching
set ignorecase      " Ignore case when searching...
set smartcase       " ...except when serach query contains a capital letter
set autoread        " Auto load files if they change on disc
set matchpairs+=<:>
set showmatch
set updatetime=300
set clipboard=unnamed
set mouse=a
set linebreak
set nolist
set mouse=
set ttymouse=
set noswapfile
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set nojoinspaces
set splitbelow
set splitright
set complete+=kspell
set colorcolumn=80
" ##############################################################################

"Cursor Icon
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q""]"

“Plugins Vundle 
" ##############################################################################
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
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
Plugin 'arcticicestudio/nord-vim'
Plugin 'iamcco/markdown-preview.nvim'
Plugin 'sheerun/vim-polyglot'
call vundle#end()
" ##############################################################################

if (has("autocmd") && !has("gui_running"))
    augroup colors
      autocmd!
      let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16": "7"}

    augroup END
  endif

let g:nord_cursor_line_number_background = 1
let g:nord_uniform_status_lines = 1
let g:nord_bold_vertical_split_line = 1
let g:nord_uniform_diff_background = 1
let g:nord_bold = 0
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1

filetype plugin indent on
autocmd vimenter * if !argc() | NERDTree | endif

highlight Comment cterm=italic gui=italic

"" Markdown
let g:mkdp_auto_start = 1
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
let g:mkdp_filetypes = ['markdown']
let g:mkdp_theme = 'dark'
""

map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1

au BufRead,BufNewFile *.md setlocal textwidth=80

" Set Airline bar theme
let g:airline_theme='nord'


" Maps
" --------------------------------
let g:mapleader = " " " Set leader to spacebar 
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


" Disable arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
