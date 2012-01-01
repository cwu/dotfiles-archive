set nocompatible " Use vim rather than vi

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()  
Bundle 'gmarik/vundle'

" Utilities
Bundle 'pyflakes.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'godlygeek/tabular'
Bundle 'sjl/gundo.vim'
Bundle 'wincent/Command-T'
Bundle 'mileszs/ack.vim'

" Syntax highlighting
Bundle 'tpope/vim-rails'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-haml'
Bundle 'itspriddle/vim-jquery'
Bundle 'othree/html5.vim'
Bundle 'tangledhelix/vim-octopress'

Bundle 'jade.vim'
Bundle 'haskell.vim'
Bundle 'vim-stylus'
Bundle 'nginx.vim'

filetype on
filetype plugin indent on

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		  " keep a backup file
endif
set history=100		" keep 50 lines of command line history
set ruler		      " show the cursor position all the time
set showcmd		    " display incomplete commands
set incsearch		  " do incremental searching


" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=a

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

" Syntastic
" --- BUNDLE: http://github.com/scrooloose/syntastic.git
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_quiet_warnings=1

autocmd BufNewFile,BufRead *.markdown setfiletype octopress

" Ack
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" Set leader
let mapleader = ","

" Fix ' to ` so it jumps to column not just line
nnoremap ' `

" Extended matching for %
runtime macros/matchit.vim

" scroll around cursor at border of screen
set scrolloff=3

" Save tmp files in /tmp
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Toggle hilighting spaces and end of lines
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

" Highlight trailing whitepsace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" use visual bell instead of audio
set visualbell

" Mixbag of options
syntax on
set background=dark
set number
set lazyredraw
set ttyfast
set nostartofline
set modeline
set encoding=utf-8

" Indenting rules
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

" Typos for saving and quitting
command! W :w
command! Q :q
command! Wqa :wqa
command! WQa :wqa

" Wildcard menu
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

" Search settings
set ignorecase
set smartcase
set incsearch
set hlsearch
set gdefault

" Command line title
set title

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  sys.path.insert(0, project_base_dir)
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
