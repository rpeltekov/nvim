"set number
"set backspace=indent,eol,start
"set autoindent
"
"set backup
"set history=50
"
"set ruler
"set showcmd
"
"vnoremap _g y:exe "grep /" . escape(@", '\\/') . "/ *.c *.h"<CR>
"
"syntax on
"set hlsearch
"filetype plugin indent on
"
"" quick put parentheses around word
":map \p i(<Esc>ea)<Esc>
":map \<S-p> bi(<Esc>ea)<Esc>
":map \c i{<Esc>ea}<Esc>
":map \<S-c> bi{<Esc>ea}<Esc>
