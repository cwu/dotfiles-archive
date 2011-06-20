set nocompatible " Use vim rather than vi

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" My bundles
Bundle 'pyflakes.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-fugitive'
Bundle 'sjl/gundo.vim'
Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'
Bundle 'wincent/Command-T'

Bundle 'tpope/vim-rails'
Bundle 'kchmck/vim-coffee-script'
Bundle 'plasticboy/vim-markdown'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-liquid'

Bundle 'jade.vim'
Bundle 'haskell.vim'
Bundle 'vim-stylus'
Bundle 'itspriddle/vim-jquery'

syntax on
set background=dark
set number

set wildmenu

set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab

nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <F4> :make<CR>
nnoremap <F5> :Tabularize /

" For word wrap navigation
nnoremap j gj
nnoremap k gk

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

set splitright
set splitbelow
set ruler
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
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

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

endif " has("autocmd")

