" Install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync
endif

call plug#begin('~/.config/nvim/plugged')
  " Make sure you use single quotes

  Plug 'tomasr/molokai'

  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/nerdcommenter'
  Plug 'monshq/vim-buffergator'

  Plug 'vim-airline/vim-airline'

  " Plug 'neomake/neomake'
  " Plug 'vim-syntastic/syntastic'
  Plug 'elixir-lang/vim-elixir'
  Plug 'chr4/nginx.vim'
  Plug 'slim-template/vim-slim'
  Plug 'stephpy/vim-yaml'
  Plug 'cespare/vim-toml'
  Plug 'dag/vim-fish'

  Plug 'tpope/vim-rails'

  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'

  Plug 'tpope/vim-fugitive'

  Plug 'neoclide/coc.nvim', {'branch': 'release'} ", 'do': { -> coc#util#install()}}

  Plug 'vim-test/vim-test'

call plug#end()

set termguicolors
colorscheme molokai

autocmd! bufwritepost .vimrc source $MYVIMRC
autocmd! bufwritepost init.vim source $MYVIMRC
"autocmd! bufwritepost *.rb Neomake mri

" Interface
  " Character encoding used inside Vim
  " Only available when compiled with the +multi_byte feature
  " try
  set encoding=utf-8
  " catch
    " like we care
  " endtry
  " Character encodings considered when starting to edit an existing file
  " Only available when compiled with the +multi_byte feature
  set fileencodings=utf-8,cp1251
  " Enhance command-line completion
  " Only available when compiled with the +wildmenu feature
  set wildmenu
  " Set completion mode
  " When more than one match, list all matches and complete first match
  " Then complete the next full match
  set wildmode=list:longest,full
  " Ignore following files when completing file/directory names
  " Version control
  set wildignore+=.hg,.git,.svn
  " OS X
  set wildignore+=*.DS_Store
  " Python byte code
  set wildignore+=*.pyc
  " Binary images
  set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
  " Set title of the window to filename [+=-] (path) - VIM
  " Only available when compiled with the +title feature
  set title
  " Show (partial) command in the last line of the screen
  " Comment this line if your terminal is slow
  " Only available when compiled with the +cmdline_info feature
  set showcmd
  " Minimal number of lines to scroll when cursor gets off the screen
  " set scrolljump=5
  " Minimal number of lines to keep above and below the cursor
  " Typewriter mode = keep current line in the center 
  set scrolloff=999
  " Always show tabs
  " set showtabline=2
  " Display invisible characters
  set list
  set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×
  " NO wrap long lines
  set wrap
  " Don't break words when wrapping
  " Only available when compiled with the +linebreak feature
  set linebreak
  set formatoptions+=l
  " Show ↪ at the beginning of wrapped lines
  if has("linebreak")
      let &sbr = nr2char(8618).' '
  endif
  " Number of column to be highlighted
  " Only available when compiled with the +syntax feature
  " set colorcolumn=100
  " Maximum width of text that is being inserted
  " Longer lines will be broken after white space to get this width
  " set textwidth=80
  " Copy indent from current line when starting a new line
  set autoindent
  " Number of spaces to use for each step of (auto)indent
  set shiftwidth=2
  " Use spaces instead of tab
  set expandtab
  " Number of spaces that a tab counts for
  set tabstop=2
  " Number of spaces that a tab counts for while performing editing operations
  set softtabstop=2
  " Number of pixel lines inserted between characters
  " Only in GUI
  set linespace=1
  " Highlight the screen line of the cursor
  " Only available when compiled with the +syntax feature
  set cursorline
  " Turn off cursor blinking in normal mode
  " Only available when compiled with GUI enabled
  set guicursor=n:blinkon0
  " Remove all components and options of the GUI
  " Only available when compiled with GUI enabled
  set guioptions=
  " Number of colors
  set t_Co=256
  " Splitting a window will put the new window below the current one
  " See :sp
  " Only available when compiled with the +windows feature
  set splitbelow
  " Splitting a window will put the new window right of the current one
  " See :vsp
  " Only available when compiled with the +vertsplit feature
  set splitright
  " Don't show the intro message starting Vim
  set shortmess+=I
  " Turn mouse pointer to a up-down sizing arrow
  " Only available when compiled with the +mouseshape feature
  set mouseshape=s:udsizing,m:no
  " Hide the mouse when typing text
  " Only works in GUI
  set mousehide
  set mouse=
  " Edit several files in the same time without having to save them
  set hidden

  " No beeps, no flashes
  set visualbell
  set t_vb=
  " List of directories which will be searched when using :find, gf, etc.
  " Search relative to the directory of the current file
  " Search in the current directory
  " Search downwards in a directory tree
  " Only available when compiled with the +path_extra feature
  set path=.,,**

  " Don't create backups
  set nobackup
  " Don't create swap files
  set noswapfile



let mapleader = ' '

" Custom Keybindings
  " switch buffers spacemacs-style
  nmap <Space><Tab> :b#<CR>

  " < > don't reset selection in visual mode
  vnoremap < <gv
  vnoremap > >gv

  " <Esc><Esc>
  " Clear the search highlight in Normal mode
  nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

  " Navigate with <Ctrl>-hjkl in Insert mode
  imap <silent> <C-h> <C-o>h
  imap <silent> <C-j> <C-o>j
  imap <silent> <C-k> <C-o>k
  imap <silent> <C-l> <C-o>l

  " Navigate lines with Ctrl shortcuts
  cnoremap <c-e> <end>
  imap     <c-e> <c-o>$
  cnoremap <c-a> <home>
  imap     <c-a> <c-o>^

  nmap <leader>q :q<CR>
  nmap <leader>w :w<CR>

  nmap <leader>j <C-w>j
  nmap <leader>k <C-w>k
  nmap <leader>h <C-w>h
  nmap <leader>l <C-w>l

  nmap <leader>wl  <C-w>v
  nmap <leader>wj  <C-w>n

  " edit .vimrc
  nmap <leader>v :tabe $MYVIMRC<CR>

  nmap <leader>p :Files<CR>
  nmap <leader>s :Ag<CR>
  nmap <leader>f :NERDTreeFind<CR>

  nmap <leader>gb :Gblame<CR>

  nmap <leader>bd :bd<CR>

  nmap <silent> <leader>nt :Ttoggle<CR>
  if has('nvim')
    tmap <silent> <Esc> <C-\><C-n>
  endif

  nmap <leader>ts :%s/\s\+$//e<CR>

  " open current line in stash
  " let os = substitute(system('uname'), '\n', '', '')
  " if os == "Darwin"
    nmap <leader>os :!noglob echo `git url`/%?at=`git rev-parse HEAD`\#<C-R>=line('.')<CR> \| xargs open<CR><CR>
  " else
    " nmap <leader>os :!noglob echo `git url`/%?at=`git rev-parse HEAD`\#<C-R>=line('.')<CR> \| xargs xdg-open<CR><CR>
  " endif



" File specific
  autocmd FileType haml setlocal expandtab
  autocmd BufNewFile,BufRead nginx/*.conf setf nginx
  autocmd BufNewFile,BufRead Jenkinsfile setf groovy
  autocmd FileType fish compiler fish



" NERDTree
  nmap <Bs> :NERDTreeToggle<CR>
  let NERDTreeShowBookmarks=1
  let NERDTreeChDirMode=2
  let NERDTreeQuitOnOpen=1
  " let NERDTreeIgnore=["\.git","\.eunit"]
  let NERDTreeShowHidden=1
  let NERDTreeKeepTreeInNewTab=0
  " Disable display of the 'Bookmarks' label and 'Press ? for help' text
  let NERDTreeMinimalUI=1
  " Use arrows instead of + ~ chars when displaying directories
  let NERDTreeDirArrows=1
  let NERDTreeBookmarksFile= $HOME . '/.vim/.NERDTreeBookmarks'

  " open nerdtree when no files specified after launch
  " autocmd StdinReadPre * let s:std_in=1
  " autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" NERDCommenter
  let g:NERDSpaceDelims = 1

" Buffergator
  nmap <CR> :BuffergatorOpen<CR>
  let g:buffergator_viewport_split_policy="T"
  let g:buffergator_sort_regime="mru"
  let g:buffergator_hsplit_size=10
  let g:buffergator_suppress_keymaps=1
  let g:buffergator_blacklist=["term:\/\/"]

" Powerline
  let g:Powerline_symbols = 'fancy'
  let g:airline_powerline_fonts = 1

" Syntastic
  let g:syntastic_ruby_checkers = ['rubocop']

" Neomake
  " let g:neomake_ruby_enabled_makers = ['mri']
  " let g:neomake_verbose = -1
  " call neomake#configure#automake('nw', 750)

" vim-test
  nmap <silent> <leader>tt :TestFile<CR>
  nmap <silent> <leader>ta :TestSuite<CR>
  nmap <silent> <leader>tl :TestLast<CR>
  nmap <silent> <leader>tn :TestNearest<CR>
  let test#strategy = "neovim"
  let test#neovim#term_position = "vertical"

" CoC
  let g:coc_global_extensions = ['coc-yaml', 'coc-solargraph'] "['coc-emoji', 'coc-eslint', 'coc-prettier', 'coc-tsserver', 'coc-tslint', 'coc-tslint-plugin', 'coc-css', 'coc-json', 'coc-pyls', 'coc-yaml']

  " Better display for messages
  " set cmdheight=2
  " Smaller updatetime for CursorHold & CursorHoldI
  set updatetime=300
  " don't give |ins-completion-menu| messages.
  set shortmess+=c
  " always show signcolumns
  "set signcolumn=yes

  " Use `lp` and `ln` for navigate diagnostics
  nmap <silent> <leader>lp <Plug>(coc-diagnostic-prev)
  nmap <silent> <leader>ln <Plug>(coc-diagnostic-next)

  " Remap keys for gotos
  nmap <silent> <leader>ld <Plug>(coc-definition)
  nmap <silent> <leader>lt <Plug>(coc-type-definition)
  nmap <silent> <leader>li <Plug>(coc-implementation)
  nmap <silent> <leader>lf <Plug>(coc-references)

  " Remap for rename current word
  nmap <leader>lr <Plug>(coc-rename)

  " Use K for show documentation in preview window
  nnoremap <silent> Q :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if &filetype == 'vim'
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Highlight symbol under cursor on CursorHold
  " autocmd CursorHold * silent call CocActionAsync('highlight')

  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  " inoremap <silent><expr> <c-space> coc#refresh()
