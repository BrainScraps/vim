set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/Vundle.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdtree'
" git
Bundle 'tpope/vim-fugitive'

" syntax
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-endwise'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-haml'
Bundle 'pangloss/vim-javascript'
Bundle 'plasticboy/vim-markdown'
Bundle 'kchmck/vim-coffee-script'
Bundle 'chrisbra/csv.vim'
Bundle 'moll/vim-node'
Bundle 'vim-scripts/vtreeexplorer'
Bundle 'kien/ctrlp.vim'
Bundle 'digitaltoad/vim-jade'
Bundle 'groenewege/vim-less'
Bundle 'slim-template/vim-slim'
Bundle 'ervandew/supertab'
Bundle 'thoughtbot/vim-rspec'
Bundle 'tpope/vim-surround'

call vundle#end()


filetype plugin indent on
set background=light
"# colorscheme solarized
set shell=sh
set laststatus=2

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set hlsearch                    "highlights search hits
set showmatch
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set mouse=a
set ttymouse=xterm2

" Powerline
set guifont=Inconsolata\ for\ Powerline:h18
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8


" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

syntax enable
set paste

" Turn Off Swap Files
set noswapfile
set nobackup
set nowb

" Keep undo history across sessions, by storing in file.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" Indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

runtime! init/**.vim

" source a .vimrc.local if there is one
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

" autosave when focus is lost
:au FocusLost * silent! wa
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let g:rspec_command = "!zeus rspec {spec}"
