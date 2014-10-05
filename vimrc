if has("vim_starting")
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  set background=dark

  "{ Useability/misc
  " show (partial) command in status line
  set showcmd
  " show function arguments if any during autocompletion
  set showfulltag
  " show matching brackets a.o.
  set showmatch
  " while browsing through windows set non active non visable
  set winminwidth=0
  set winminheight=0
  " when splittin open window below
  set splitbelow
  " number of commands and other things to remember
  set history=50
  " things to log in viminfo
  set viminfo='50,/30,"50,
  set complete=.,w,b,u,U,t,i,d,k,kspell
  " set dict=/usr/share/dict/words
  " set thesaurus
  " wild
  set wildmode=list:longest,full
  set wildmenu
  "FIXME: is this working for you?
  set wildignore+=*/tmp/*,*.so,*.swp,*.pyc
  " when compeleting insert longest commen text
  set completeopt=menuone,longest
  " do autoindent when starting a new line
  set smartindent
  " Take indent from current line
  set autoindent
  " automatically change window's cwd to file's dir
  set autochdir
  "}

  "{ Moving
  " keep cursor in same column when moving cursor up and down
  set nostartofline
  " easy jumping from from end of one sentence to beggining of the next
  set whichwrap=<,>,[,],b,s,h,l
  " make backspace usable
  set backspace=indent,eol,start
  "for moving around between windows
  imap <C-w> <C-o><C-w>
  nmap <C-h> <C-w>h<C-w>_
  nmap <C-j> <C-w>j<C-w>_
  nmap <C-k> <C-w>k<C-w>_
  nmap <C-l> <C-w>l<C-w>_
  nmap <C-i> <C-w><
  nmap <C-o> <C-w>>
  "}

  "{ Wrapping
  " I don't care for wrapping text
  set nowrap
  " But here are some sensible settings if wrapping is needed
  set showbreak=" \ "
  " Indent after textwrap
  set wrapmargin=2
  " for emails this might be a good setting
  "set textwidth=72
  "}
  
  "{ Search
  set hlsearch
  " highlight as you are typing a searchpattern
  set incsearch
  " set casesentitive search
  set noignorecase
  " Use <C-L> to clear the highlighting of :set hlsearch.
  if maparg('<C-L>', 'n') ==# ''
      nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
  endif
  "}

  "{ Tabs(\t) - I don't like 'em
  " number of spaces in an indent tab
  set shiftwidth=4
  "number of spaces in a tab
  set tabstop=4
  set softtabstop=4
  "inserts space characters whenever the tab key is pressed
  set expandtab
  "converts tabs to spaces
  set smarttab
  "}

  "{ Foldes
  "set foldclose=all
  set foldmethod=marker
  set foldnestmax=5
  set foldminlines=2
  set foldmarker={,}
  " Movements that open folds
  set foldopen=block,hor,mark,percent,quickfix,search,tag,undo
  "}

  "{ Backups
  "place to put Backups
  set backupdir=~/.vim/backups//,/var/tmp//,/tmp//,.
  set directory=~/.vim/backups//,/var/tmp//,/tmp//,.
  "wite content on file if its been modified
  set autowriteall
  "write a backup before writing to a file
  set writebackup

  "}

  "{ file formats
  " I dont like wintendo
  "set fileformats+=mac
  set fileformat=unix
  set encoding=utf-8
  set termencoding=iso-8859-1
  "}

  " { Misc (unsorted)
  " Highlight current line
  set nocursorline
  " do not update screen while running macros
  set lazyredraw
  " Use <leader>l to toggle display of whitespace
  nmap <leader>l :set list!<CR>
  " And set some nice chars to do it with
  set listchars=tab:»\ ,eol:¬
  " report number of lines changed
  set report=0

  " keep lines/chars from the edge when moving
  if !&scrolloff
      set scrolloff=1
  endif
  if !&sidescrolloff
      set sidescrolloff=5
  endif
  set display+=lastline

  set formatoptions=rqo
  set nrformats-=octal
  "TODO: readup
  set shiftround

  set ttimeout
  set ttimeoutlen=50
  " }

  "{ Encryption
  set cryptmethod=blowfish
  "}


  if &encoding ==# 'latin1' && has('gui_running')
      set encoding=utf-8
  endif
  if &listchars ==# 'eol:$'
      set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
      if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
          let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
      endif
  endif
  if &shell =~# 'fish$'
      set shell=/bin/bash
  endif
  if &history < 1000
      set history=1000
  endif
  if &tabpagemax < 50
      set tabpagemax=50
  endif
  if !empty(&viminfo)
      set viminfo^=!
  endif

  " Allow color schemes to do bright colors without forcing bold.
  if &t_Co == 8 && $TERM !~# '^linux'
      set t_Co=16
  endif
  " Load matchit.vim, but only if the user hasn't installed a newer version.
  "if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  "    runtime! macros/matchit.vim
  "endif

  inoremap <C-U> <C-G>u<C-U>
  nnoremap & :&&<CR>
  xnoremap & :&&<CR>
  " Make Y consistent with C and D. See :help Y.
  nnoremap Y y$

  "plugins

  function! g:ToggleColorColumn()
      if &colorcolumn != ''
          setlocal colorcolumn&
      else
          setlocal colorcolumn=+1
      endif
  endfunction

  nnoremap <silent> <leader>cc :call g:ToggleColorColumn()<CR>

  if filereadable($HOME."/.vim/extras.vim")
      source ~/.vim/extras.vim
  endif

  " if needed I can overwrite my general vim settings on a system basis here
  if filereadable($HOME."/.vimrc.local")
      source ~/.vimrc.local
  endif

endif

call neobundle#begin(expand("~/.vim/bundle/"))
NeoBundleFetch "Shougo/neobundle.vim"

NeoBundle "klen/python-mode.git"
NeoBundle "tpope/vim-fugitive.git"
NeoBundle "scrooloose/nerdtree.git"
NeoBundle "scrooloose/nerdcommenter.git"
NeoBundle "mattn/emmet-vim.git"
NeoBundle "bling/vim-airline.git"
"NeoBundle "airblade/vim-gitgutter.git"
"maybe https://github.com/mhinz/vim-signify.git
NeoBundle "kien/ctrlp.vim.git"
"NeoBundle "bling/vim-bufferline.git"
NeoBundle "vim-scripts/DrawIt.git"
"NeoBundle "ervandew/supertab.git"
NeoBundle "Shougo/neocomplete.vim.git"
NeoBundle "Raimondi/delimitMate.git"
NeoBundle "tpope/vim-tbone.git"
NeoBundle "Shougo/neosnippet.vim.git"
NeoBundle "Shougo/neosnippet-snippets.git"
NeoBundle "daylerees/colour-schemes.git", { "rtp": "vim/" }
NeoBundle "flazz/vim-colorschemes.git"
NeoBundle "chrisbra/csv.vim.git"
NeoBundle "mbbill/undotree.git"
NeoBundle "vim-scripts/boxdraw.git"

"others
"https://github.com/tpope/vim-surround
"https://github.com/edkolev/tmuxline.vim
"
call neobundle#end()
filetype plugin indent on
NeoBundleCheck

""" Plugin settings"

""{{{ klen/python-mode.git
" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pylint,pep8"
" Auto check on save
let g:pymode_lint_write = 1
let g:pymode_lint_onfly = 0
"What to ignore
let g:pymode_lint_ignore = "C0301,C901,E265,E501,E711,E712,R092,W0702"


" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 1

" let bundle/vim-python-pep8-indent handle indent
let g:pymode_indent = 0

" Don't open cwindow 
let g:pymode_lint_cwindow = 0
"}}}

""{{{ scrooloose/nerdtree.git
let NERDTreeIgnore = ['\~$','\.pyc$','__pycache__']
"}}}

""{{{ bling/vim-airline.git
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
""}}}

""{{{ airblade/vim-gitgutter.git
"let g:gitgutter_sign_added = 'xx'
"let g:gitgutter_sign_modified = 'yy'
"let g:gitgutter_sign_removed = 'zz'
"let g:gitgutter_sign_modified_removed = 'ww'
"let g:gitgutter_diff_args = '-w'
""}}}

""{{{ klein/ctrlp.vim.git
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|svn)$',
  \ 'file': '\v\.(so|pyc)$',
  \ }
""}}}

""{{{ bling/bufferline.git
let g:bufferline_rotate = 1
 let g:bufferline_echo = 0
""}}}

""{{{ Shougo/neocomplete.vim.git
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
set completeopt+=longest
let g:neocomplete#enable_auto_select = 0
"let g:neocomplete#disable_auto_complete = 1
inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

""}}}

""{{{ Shugo/neosnipper.vim.git
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

"" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

"" For snippet_complete marker.
"if has('conceal')
  "set conceallevel=2 concealcursor=i
"endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/snippets'
""}}}

""{{{ mbbill/undotree.git
if has("persistent_undo")
    set undodir = "$HOME."/.vim/undodir"
    set undofile
endif
""}}}
