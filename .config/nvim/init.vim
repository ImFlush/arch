" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2017 Sep 20
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
"if v:progname =~? "evim"
"  finish
"endif

" Get the defaults that most users want.
" source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif


" Settings
set tabstop=4
set backupdir=/tmp//
set directory=/tmp//
set undodir=$XDG_CONFIG_HOME/vimundo/
set nocompatible
set showcmd
syntax enable
set path+=**
set ignorecase
set smartcase
set laststatus=0
hi StatusLine ctermfg=Black ctermbg=White

" Create ctags
command! Mktags !ctags -R .

" Copy and Past
map <C-p> "+p
map <C-c> "+y
"vnoremap <C-c> "*y :let @+=@*<CR>

" Line Numbers
set nu rnu
:nmap <C-n> :set invrelativenumber<Cr>
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" jumpt to <++>
map <space><space> /<++><enter>cf>
" Become root in vim
"map <F9> :w !sudo tee %<enter>

" R Markdown Compilieren
"autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
" Wenn Datei ein pdf wird zathura starten
"autocmd FileType rmd map <F2> :!vimOpenFile %<enter>

"autocmd .Xresources map <F5> :!xrdb .Xresources
