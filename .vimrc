" $Id: .vimrc,v 1.4 2010/11/09 12:47:57 tomoki-m Exp tomoki-m $

" $Log: .vimrc,v $
" Revision 1.4  2010/11/09 12:47:57  tomoki-m
" add euc-jp to fileencodings
"
" Revision 1.3  2010/08/28 14:02:49  tomoki-m
" cleanup
"
" Revision 1.2  2008/08/26 02:56:44  tomoki-m
" delete "sjis" from fileencordings, and add cp932.
" now i can save sjis files.
" SEE ALSO: Software Design 2006/3
"
" Revision 1.1  2008/08/26 02:54:48  tomoki-m
" Initial revision
"

" {{{ software design 2013/9
set nocompatible
set backspace=start,eol,indent
set whichwrap=b,s,[,],<,>,~
set mouse=
" }}}
"
set number
syntax on
set background=dark
set ignorecase
set showmatch
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<
"set display=uhex
set showcmd
set notitle
set scrolloff=2

" color
"-----------------------------------------------------------
colo murphy
highlight LineNr ctermfg=yellow ctermbg=darkgrey
highlight SpecialKey cterm=underline ctermfg=darkgrey
highlight SpecialKey guifg=#0000BB

" mbString Space
highlight mbSpace ctermbg=white ctermfg=white
"match mbSpace //

" encoding
"-----------------------------------------------------------
" Software Design Mar, 2006 --- sjis savable!
set encoding=utf-8
"set fileencoding=japan
set fileencoding=utf-8
"set fileencodings=iso-2022-jp,cp932,utf-8,ucs-2le,ucs-2
set fileencodings=utf-8,iso-2022-jp,cp932,eucjp

" status ling
"-----------------------------------------------------------
"set statusline=%F%M%R%=code:%B%H%W
"set statusline=%<%f\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v\ %l/%L
"set statusline=%<%f\ %m%r%h%w%{GetStatusEx()}%=%l,%c%V%8P
"set statusline=%<%f\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v\ %l/%L
set statusline=%<%F\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v\ %l/%L
set cmdheight=2
set laststatus=2

" search
"-----------------------------------------------------------
set incsearch
set ignorecase
set smartcase
set hlsearch

" tab
"-----------------------------------------------------------
set tabstop=4
set shiftwidth=4
"set shiftwidth=8 " sw
"set softtabstop=0
"set smarttab
set expandtab
inoremap <C-Tab> <C-V><Tab>

" backup
"-----------------------------------------------------------
set backup
set backupdir=~/.vim/backup
set swapfile
set directory=~/.vim/swap

" skeletons
"----------------------------------------------------------
"autocmd!
"set verbose=9
"autocmd BufNewFile  *.html   0r ~/.vim/skel/skeleton.html
"autocmd BufNewFile  *.php          0r ~/.vim/skel/skeleton.php
"autocmd BufNewFile  phpinfo.php    0r ~/.vim/skel/phpinfo.php
"autocmd BufNewFile  .htaccess      0r ~/.vim/skel/skeleton.htaccess
"autocmd BufNewFile  *.c      0r ~/.vim/skel/skeleton.c


" --------------------------------------------------------
"abbr #b /****************************************************
"abbr #e ****************************************************/
if has("autocmd")
  filetype plugin indent on
  autocmd FileType perl,cgi :compiler perl  "コンパイラの指定

  " テンプレ http://d.hatena.ne.jp/higeorange/20071003/1191356790
  "autocmd BufNewFile *.html 0r ~/.vim/templates/skel.html

  " filetypeをセット http://d.hatena.ne.jp/rdera/20090110/1231565387
  " autocmd BufNewFile,BufReadPost ~/.zfunc/* :set ft=zsh

  " カーソルの位置を復元 Ubuntu 8.10
  " http://d.hatena.ne.jp/chonmagejiro/20080815/1218780398
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
endif

