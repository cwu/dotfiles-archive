set nocompatible " Use vim rather than vi

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Utilities 
Bundle 'pyflakes.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-fugitive'
Bundle 'sjl/gundo.vim'
Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'
Bundle 'wincent/Command-T'

" Syntax highlighting
Bundle 'tpope/vim-rails'
Bundle 'kchmck/vim-coffee-script'
Bundle 'plasticboy/vim-markdown'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-liquid'
Bundle 'itspriddle/vim-jquery'
Bundle 'othree/html5.vim'

Bundle 'jade.vim'
Bundle 'haskell.vim'
Bundle 'vim-stylus'

" Syntactic sugar
Bundle 'Twinside/vim-haskellConceal'

syntax on
set background=dark
set number
set lazyredraw
set ttyfast
set nostartofline
set modeline
set encoding=utf-8

set autoindent
set smarttab
set shiftround
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

set infercase

set grepprg=ack
set grepformat=%f:%l:%m

set formatprg=par

set splitright
set splitbelow

command! W :w
set wildmenu
set wildignore=*.o,*.obj,*.pyc,*.swc,*.DS_STORE,*.bkp

nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <F4> :make<CR>
nnoremap <F5> :Tabularize /

" For word wrap navigation
nmap j gj
nmap k gk

" Don't need to press shift
nnoremap ; :

" Split navigation
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

set ignorecase
set smartcase
set incsearch
set gdefault

set title

filetype on
filetype plugin indent on

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

command -nargs=1 Silent
  \ | execute ':silent '.<q-args>
  \ | execute ':redraw!'

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		  " keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		      " show the cursor position all the time
set showcmd		    " display incomplete commands
set incsearch		  " do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=a

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	 	\ | wincmd p | diffthis

" Syntastic
" --- BUNDLE: http://github.com/scrooloose/syntastic.git
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_quiet_warnings=1
