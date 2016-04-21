" Source a global configuration file if available
"if filereadable("/etc/vim/vimrc")
"  source /etc/vim/vimrc
"endif

" added by softprop.sh script

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

set encoding=utf-8
set listchars=eol:¬,tab:⇥\ ,trail:␣,extends:»,precedes:«,nbsp:·

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
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

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
" recommended
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 4
" me
let g:syntastic_mode_map={"mode":"active", "active_filetypes": [], "passive_filetypes": ["c", "cpp", "cuda"]}
let g:syntastic_cpp_compiler_options = ' -std=c++11'
let g:syntastic_cpp_include_dirs = ['/usr/include/x86_64-linux-gnu/qt5/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_cpplint_exec = 'cpplint'
let g:syntastic_cpp_cpplint_args = '--verbose=4'

