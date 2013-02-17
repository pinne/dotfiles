" ~/Documents/dotfiles/vim/sessions/cycle_hire.vim: Vim session script.
" Created by session.vim 1.5 on 17 februari 2013 at 18:36:26.
" Open this file in Vim and run :source % to restore your session.

set guioptions=ac
silent! set guifont=PragmataPro\ 16
if exists('g:syntax_on') != 1 | syntax on | endif
if exists('g:did_load_filetypes') != 1 | filetype on | endif
if exists('g:did_load_ftplugin') != 1 | filetype plugin on | endif
if exists('g:did_indent_on') != 1 | filetype indent on | endif
if &background != 'light'
	set background=light
endif
if !exists('g:colors_name') || g:colors_name != 'solarized' | colorscheme solarized | endif
call setqflist([])
let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Documents/Code/Erlang/cycle_hire
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +14 src/ev_docking_station.erl
badd +7 README.md
badd +28 src/ev_supervisor.erl
badd +1 .git/index
args src/
set lines=41 columns=152
edit src/ev_supervisor.erl
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 27 + 76) / 152)
exe '2resize ' . ((&lines * 26 + 20) / 41)
exe 'vert 2resize ' . ((&columns * 94 + 76) / 152)
exe '3resize ' . ((&lines * 12 + 20) / 41)
exe 'vert 3resize ' . ((&columns * 94 + 76) / 152)
exe 'vert 4resize ' . ((&columns * 29 + 76) / 152)
argglobal
enew
" file NERD_tree_2
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
lcd ~/Documents/Code/Erlang/cycle_hire
wincmd w
argglobal
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=1
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 28 - ((17 * winheight(0) + 13) / 26)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
28
normal! 0
lcd ~/Documents/Code/Erlang/cycle_hire
wincmd w
argglobal
edit ~/Documents/Code/Erlang/cycle_hire/.git/index
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 6) / 12)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/Documents/Code/Erlang/cycle_hire
wincmd w
argglobal
enew
file ~/Documents/Code/Erlang/cycle_hire/__Tagbar__
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
lcd ~/Documents/Code/Erlang/cycle_hire
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 27 + 76) / 152)
exe '2resize ' . ((&lines * 26 + 20) / 41)
exe 'vert 2resize ' . ((&columns * 94 + 76) / 152)
exe '3resize ' . ((&lines * 12 + 20) / 41)
exe 'vert 3resize ' . ((&columns * 94 + 76) / 152)
exe 'vert 4resize ' . ((&columns * 29 + 76) / 152)
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
tabnext 1
1wincmd w
let s:bufnr = bufnr("%")
NERDTree ~/Documents/Code/Erlang/cycle_hire
execute "bwipeout" s:bufnr
1resize 39|vert 1resize 27|2resize 26|vert 2resize 94|3resize 12|vert 3resize 94|4resize 39|vert 4resize 29|
tabnext 1
2wincmd w

" vim: ft=vim ro nowrap smc=128
