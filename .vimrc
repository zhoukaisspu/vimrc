set showcmd
set encoding=utf-8
set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim'

call vundle#end()
filetype plugin indent on

"normal mode mapping{{{
let mapleader = ","
map <leader><space> /
"}}}

"NERDTree{{{
map <leader>nn :NERDTreeToggle<CR>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<CR>
"}}}
