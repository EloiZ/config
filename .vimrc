set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Bundle 'Valloric/YouCompleteMe'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on
filetype indent plugin on
set background=dark
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set mouse=a
set hlsearch
set number
set relativenumber
set smartindent
set term=xterm-256color
colorscheme molokai

filetype plugin indent on 
au FileType py set autoindent
au FileType py set smartindent
set t_Co=256
let g:pep8_map='F5'
set ts=4
set sw=4

autocmd FileType make setlocal noexpandtab
let mapleader=","

" Folds:
map <leader>f <Esc>:set fen fdn=3 fdm=indent fml=1 fdc=3<CR>

set cursorline
hi CursorLine cterm=bold ctermbg=0
hi Folded ctermfg=2 ctermbg=0
hi FoldColumn ctermfg=2 ctermbg=0

let g:sclangTerm = "urxvt -e"

autocmd FileType tex setlocal spell spelllang=en
 highlight SpellBad ctermfg=red ctermbg=none

let NERDTreeIgnore=['\.o$', '\.cmo$', '\.cmx$', '\.cmi$', '\.lib$', '\.pyc$']

set wildmode=list:longest

au BufRead,BufNewFile *.make set filetype=make
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.lus set filetype=lustre
au BufRead,BufNewFile *.scade set filetype=scade

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
	let l:modeline = printf(" vim: set sts=%d ts=%d sw=%d tw=%d %set :",
		\ &softtabstop, &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
	let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
	call append(line("$"), l:modeline)
endfunction

nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" indentation for long line wraps
set wrap
set linebreak
set breakindent
let &showbreak = '>   '

" Convenient save remaping
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>

" Convenient moving between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Open new split panes to right and bottom
set splitbelow
set splitright

" toggle paste nopaste
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Automaticaly apply wimrc to opened windows
autocmd! bufwritepost .vimrc source %

" Remove highlight of your last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Showing length
set colorcolumn=80
highlight ColorColumn ctermbg=233

" Useful settings
set history=700
set undolevels=700

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
 
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" spell checking
" set spell

" Let the cursor to previous position
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

imap jk <Esc>
imap jj <Esc>

"define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred

" flag unnecessary whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" YouCompleteMe customization
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

