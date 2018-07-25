source $VIMRUNTIME/vimrc_example.vim
set showcmd
set encoding=utf-8 
set guifont=Consolas:h10
set nobackup " no backup
set nu " show line numbers

" manage plugin by Vundle
filetype off
set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
let path='$HOME/vimfiles/bundle'
call vundle#begin(path)

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'dracula/vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Raimondi/delimitMate'
call vundle#end()

filetype plugin indent on

let g:ycm_global_ycm_extra_conf = 'C:/Users/ZhouKai/vimfiles/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'

" NERDTree{{{
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
map <leader>nn :NERDTreeToggle<CR>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<CR>
" }}}

"YouCompleteMe {{{
let g:ycm_key_list_select_completion = ['<Enter>','<Down>']
let g:ycm_key_list_previous_completion =['<S-TAB>','<Up>']
"}}}


"delimitMate{{{
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
inoremap <expr> <TAB> delimitMate#JumpAny()
"}}}

" normal mode mapping
map <space> /
"map <C-space> ?

let g:vim_markdown_folding_disabled = 1
syntax on
color dracula " config theme

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction


