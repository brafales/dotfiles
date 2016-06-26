set nocompatible
filetype off                  "required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-rails'
Plugin 'msanders/snipmate.vim'
Plugin 'tpope/vim-surround'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'godlygeek/tabular'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-scripts/camelcasemotion'
Plugin 'skwp/YankRing.vim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-repeat'
Plugin 'thoughtbot/vim-rspec'
Plugin 'skwp/vim-iterm-rspec'
Plugin 'tpope/vim-fireplace'
Plugin 'vim-scripts/paredit.vim'
Plugin 'venantius/vim-eastwood'
Plugin 'venantius/vim-cljfmt'
Plugin 'tpope/vim-salve'
call vundle#end()

filetype plugin indent on     " required!
