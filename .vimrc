"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=300

" Enable filetype plugin
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" mouse
set mouse=a

" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

" Fast saving and closing
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>

" Set 7 lines to the curors - when moving vertical..
" set so=7

" Turn on Wild menu
set wildmenu 

" Always show current position
set ruler 

" The commandbar height
set cmdheight=1 

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Search
set hlsearch
set incsearch
set ignorecase smartcase

" Set magic on, for regular expressions
set magic 

" Show matching bracets when text indicator is over them
set showmatch 

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=

" Number
set number

" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

" <tab>
set shiftwidth=4
set tabstop=4
set smarttab
" set expandtab

" Tab configuration
map <leader>tn :tabnew<cr>
map <leader>te :tabedit 
map <leader>tc :tabclose<cr>
try
  set switchbuf=useopen,usetab
  set stal=2
catch
endtry

set showtabline=1

" Indent
set ai "Auto indent
set si "Smart indet
set wrap "Wrap lines

" Enable syntax hl
syntax enable 

" Colorscheme
colors desert 

" Disable the IM
set noimd

" GUI
if has("gui_running")
  set guioptions-=T
  set guioptions-=L
  set guioptions-=r
endif

" File encodings
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" Switch buffers
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Hidden buffers
set hidden

" Statusline
set laststatus=2
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c
autocmd filetype qf if &buftype == "quickfix" | setlocal statusline=\ %F%m%r%h\ \ \ Line:\ %l/%L:%c | endif
function! CurDir()
	let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
	return curdir
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => A
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>o :A<CR>
nnoremap <silent> <leader>f :IH<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FuzzyFinder
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fuf_previewHeight=0
nnoremap <silent> <F4> :FufFileWithCurrentBufferDir<CR>
nnoremap <silent> <F5> :FufFile<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERD_commenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <A-/> ,c<space>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Buffer Explorer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Bookmark
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vbookmark_bookmarkSaveFile = $HOME . '/.vimbookmark'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mutable
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set font
set gfn=Monaco:h13

" Smart mappings on the command line
cno $w \<\><left><left>
cno $c \<\>\C<left><left><left><left>

" Fast searching
function! s:vimgrepHelper(m, f)
	exec 'map <leader>' . a:m . 'i :vim //j ' . a:f . '<HOME><right><right><right><right><right>'
	exec 'map <leader>' . a:m . 's :vim /\C/j ' . a:f . '<HOME><right><right><right><right><right>'
	exec 'map <leader>' . a:m . 'ws :vim /\<\>\C/j ' . a:f . '<HOME><right><right><right><right><right><right><right>'
endfunction

call s:vimgrepHelper('v', '**/*.c **/*.cpp **/*.cxx **/*.cc **/*.h **/*.hpp **/*.hxx **/*.hh **/*.inl **/*.inc')
call s:vimgrepHelper('j', '**/*.js')
call s:vimgrepHelper('t', '**/*.txt')
