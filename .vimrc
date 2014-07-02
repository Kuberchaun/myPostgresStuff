set nocompatible
if &term =~ "xterm"
" 256 colors
let &t_Co = 256
" restore screen after quitting
let &t_ti = "\<Esc>7\<Esc>[r\<Esc>[?47h"
let &t_te = "\<Esc>[?47l\<Esc>8"
if has("terminfo")
  9     let &t_Sf = "\<Esc>[3%p1%dm"
 10     let &t_Sb = "\<Esc>[4%p1%dm"
 11   else
 12     let &t_Sf = "\<Esc>[3%dm"
 13     let &t_Sb = "\<Esc>[4%dm"
 14   endif
 15 endif
 16
 17 syntax enable
 18 colorscheme monokai
 19
 20
 21
 22 filetype off
 23 " set the runtime path to include Vundle and initialize
 24 set rtp+=~/.vim/bundle/vundle/
 25 call vundle#rc()
 26 " alternatively, pass a path where Vundle should install bundles
 27 "let path = '~/some/path/here'
 28 "call vundle#rc(path)
 29
 30 " let Vundle manage Vundle, required
 31 Bundle 'gmarik/vundle'
 32
 33 "START Bundles Bob Installed
 34 "Bundle 'Lokaltog/vim-easymotion'
 35 "Bundle 'acx0/Conque-Shell'
 36 "Bundle 'kien/ctrlp.vim'
 37 "Bundle 'Shougo/neocomplete.vim'
 38 "Bundle 'Shougo/neosnippet.vim'
 39 "Bundle 'Shougo/neosnippet-snippets'
 40 "Bundle 'airblade/vim-gitgutter'
 41 "Bundle 'Valloric/YouCompleteMe'
 42 "Bundle 'ervandew/supertab'
 43
 44 "END Bundles Bob Installed
 45
 46 filetype plugin indent on
 47 filetype plugin on
 48 set omnifunc=syntaxcomplete#Complete
 49 set mouse=a  "Allows you to click around the text editor with your mouse to move the cursor
 50 set number  "Enables line numberig
 51 highlight ColorColumn ctermbg=magenta
 52 call matchadd('ColorColumn', '\%81v', 100)
 53 set nowrap
 54 syntax on

  55 set tabstop=4     " a tab is four spaces
  56 set backspace=indent,eol,start " allow backspacing over everything in insert mode
  57
  58 set dictionary+=/home/henkbl/.vim/myDicts/sqlserver.txt
  59 set mousehide "Hide mouse when typing
  60
  61 "let g:SuperTabDefaultCompletionType = "context"
  62
  63 function! SuperCleverTab()
  64    "check if at beginning of line or after a space
  65     if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
  66       return "\<Tab>"
  67     else
  68        " do we have omni completion available
  69        if &omnifunc != ''
  70           "use omni-completion 1. priority
  71           return "\<C-X>\<C-O>"
  72        elseif &dictionary != ''
  73           " no omni completion, try dictionary completio
  74           return “\<C-K>”
  75        else
  76           "use omni completion or dictionary completion
  77           "use known-word completion
  78           return "\<C-N>"
  79       endif
  80     endif
  81 endfunction
  82 inoremap <Tab> <C-R>=SuperCleverTab()<CR>

