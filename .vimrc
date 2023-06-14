" defining fzf functions to search anywhere in the git repo or anywhere in the
" directory that you are in
function! FZF() abort
  let l:tempname = tempname()
  execute 'silent !cd $(git rev-parse --show-toplevel || pwd); echo $(pwd)/$(fzf --multi | awk ''{ print $1":1:0" }'') > ' . fnameescape(l:tempname)
  try
    execute 'cfile ' . l:tempname
    redraw!
  finally
    call delete(l:tempname)
  endtry
endfunction

function! FZF2() abort
  let l:tempname = tempname()
  execute 'silent !cd $(pwd); echo $(pwd)/$(fzf --multi | awk ''{ print $"1:1:0" }'') > ' . fnameescape(l:tempname)
  try
    execute 'cfile ' . l:tempname
    redraw!
  finally
    call delete(l:tempname)
  endtry
endfunction


" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Turn on syntax highlighting
syntax on

" Pick a leader key
let mapleader = " "

" Set the shortcuts to search using fzf
command! -nargs=* FileZF call FZF()
command! -nargs=* FileZF call FZF2()
  
nmap <leader>f :FileZF<CR>
nmap <leader>F :FileZF2<CR>

" Open the tree more easily
map <leader>t :Lexplore<CR>

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set textwidth=80
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Textmate holdouts

" Formatting
"map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" add in mouse support
set mouse-=a

" split more naturally
set splitbelow
set splitright
