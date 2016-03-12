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

:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Open new split panes to right and bottom
set splitbelow
set splitright
