" Source a global configuration file if available
"if filereadable("/etc/vim/vimrc")
"  source /etc/vim/vimrc
"endif

syntax on

set nocompatible
set number
set ruler

set mouse=a
set ttymouse=xterm2
set scrolloff=2

set backspace=indent,eol,start

set autoindent
"set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set showcmd
set incsearch
set hlsearch
set ignorecase	
set smartcase	
set wildmenu
set wildmode=longest:full
set nomodeline

set textwidth=80

set autoread

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

if has("autocmd")
  filetype plugin indent on
endif

set t_Co=256
colorscheme phoria256 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" for when you hate your life
command W  :execute ':silent w !sudo tee > /dev/null %' | :edit!
command Wq :execute ':W' | :q
ca w!! W
ca x!! Wq

au BufRead,BufNewFile *.md set filetype=markdown

" pathogen crap
call pathogen#infect()

" Nim crap
fun! JumpToDef()
  if exists("*GotoDefinition_" . &filetype)
    call GotoDefinition_{&filetype}()
  else
    exe "norm! \<C-]>"
  endif
endf
" Jump to tag
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i
" end Nim crap

" Syntastic crap
let g:syntastic_cpp_compiler_options = ' -std=c++11'

