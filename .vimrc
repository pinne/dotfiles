" F8 Build & Run, C
nnoremap <F8> :!gcc % -Wall && ./a.out<CR>

nmap <F9> :!make clean && make pdf
map ,cd :lcd %:h<CR>

" Set the search scan to wrap around the file
set wrapscan

" Set the forward slash to be the slash of note (for Windows).
set shellslash

" Command line hight
set ch=1

" set visual bell -- I hate that damned beeping
set vb

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" See :help 'cpoptions' for these ones.  'cpoptions' has a huge
" set of possible options
set cpoptions=ces$

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
set list

" Status line
set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]

" tell Vim to always put a status line in, even if there is only one
" window
set laststatus=2

" Hide the mouse pointer while typing
set mousehide

" For Mutt
au BufRead /tmp/mutt-* set tw=72

" This is the timeout used while waiting for user input on a
" multi-keyed macro or while just sitting and waiting for another
" key to be pressed measured in milliseconds.
"
" i.e. for the ",d" command, there is a "timeoutlen" wait
"      period between the "," key and the "d" key.  If the
"      "d" key isn't pressed before the timeout expires,
"      one of two things happens: The "," command is executed
"      if there is one (which there isn't) or the command aborts.
"
" The idea here is that if you have two commands, say ",dv" and
" ",d" that it will take 'timeoutlen' milliseconds to recognize
" that you're going for ",d" instead of ",dv"
"
" In general you should endeavour to avoid that type of
" situation because waiting 'timeoutlen' milliseconds is
" like an eternity.
set timeoutlen=500

" Keep some stuff in the history
set history=100

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" When the page starts to scroll, keep the cursor 8 lines from
" the top and 8 lines from the bottom
set scrolloff=8

" Allow the cursor to go in to "invalid" places
set virtualedit=all

" For how *I* code these are the best types of settings for
" completion but I get rid of some neat things that you might
" like
set complete=.,w,b,t

" Incrementally match the search.
set incsearch

" Highlight search terms
set hlsearch

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048

" Indent C code
set cindent

" Tab behaviour
set ts=8 sts=8 sw=8 noexpandtab

" Column width
set textwidth=80

colorscheme fruity
"set background=light
"colorscheme mayansmoke

filetype plugin on

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Enable file type detection
  filetype on

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType c,cc,cpp setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType java setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType sql setlocal ts=3 sts=3 sw=3 expandtab
  autocmd FileType tex setlocal ts=3 sts=3 sw=3 expandtab spell

  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml
endif

" These settings are needed for latex-suite
filetype indent on
filetype plugin on
filetype on
let g:tex_flavor='latex'
set grepprg=grep\ -nH\ $*

" Automatic LaTeX compile and XDVI refresh
"au BufWritePost *.tex silent call Tex_CompileLatex()
"au BufWritePost *.tex silent !pkill -USR1 xdvi.bin