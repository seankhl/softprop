" Source a global configuration file if available
"if filereadable("/etc/vim/vimrc")
"  source /etc/vim/vimrc
"endif

syntax on

set nocompatible
set number
set ruler
set laststatus=2

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

" markdown beautification
au BufRead,BufNewFile *.md set filetype=markdown

" map F2 to show/hide whitespace. maybe a better key in the future
nnoremap <F2> :<C-U>setlocal lcs=tab:>-,trail:-,eol:$ list! list? <CR>

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
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i

" Syntastic crap
let g:syntastic_cpp_compiler_options = ' -std=c++11'

