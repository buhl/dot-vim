" load in default vim settings
source ~/.vimrc

set laststatus=2


"{ extra gui settings
set guioptions=aegit
set number
set foldcolumn=1                                                                                                                                               
set mousemodel=popup_setpos
"}

" if needed I can overwrite my general vim settings on a system basis here
if filereadable($HOME."/.gvimrc.local")
  source ~/.gvimrc.local
endif

