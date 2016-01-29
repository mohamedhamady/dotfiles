execute pathogen#infect()
syntax on
filetype plugin indent on

set nocompatible

set nofoldenable

set bg=dark
set nu

syntax on
set hidden

set wildmenu
set wildmode=longest:full,full

set showcmd

set ignorecase
set smartcase

set ruler
set laststatus=2
set confirm
set cmdheight=2

set ttyfast

set scrolloff=3
set sidescrolloff=3

set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set backup
set undodir=~/.vim/tmp/undo//
set undofile

set relativenumber
set autoindent

" CFEngine files
au BufRead,BufNewFile *.cf set ft=cf3
" you probably want more options here, see for example this excellent article
" " http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" I don't like to have all my code folded when I open a file so I set the
" foldlevelstart to 99
"
set foldlevelstart=99
nnoremap <Space> za
nnoremap <S-Space> zA
vnoremap <S-Space> zA

nnoremap <F1> :NERDTreeToggle<cr>
nnoremap <c-b> :CtrlPBuffer<cr>
nnoremap <F2> :TagbarToggle<cr>
nnoremap <F3> :RainbowParenthesesToggleAll<cr>

let g:pymode_lint_write = 0
set t_Co=16
" colorscheme solarized
