let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Project/dicoding_flutter/buku_resep
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
set shortmess=aoO
badd +93 lib/screens/search_page.dart
badd +1 ./
badd +48 lib/widgets/search_bar.dart
badd +23 lib/screens/main_screen.dart
badd +41 lib/screens/home_page.dart
badd +34 lib/model/resep.dart
badd +1067 ~/Development/flutter/packages/flutter/lib/src/material/list_tile.dart
badd +114 lib/screens/detail_screen.dart
badd +55 lib/widgets/resep_grid.dart
badd +18 lib/widgets/list_bahan.dart
badd +21 lib/screens/favorite_page.dart
badd +544 output:///flutter-dev
badd +1 macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_16.png
badd +319 ~/Development/flutter/packages/flutter/lib/src/cupertino/text_field.dart
argglobal
%argdel
$argadd ./
edit lib/screens/main_screen.dart
argglobal
balt lib/screens/favorite_page.dart
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
let s:l = 30 - ((12 * winheight(0) + 10) / 21)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 30
normal! 022|
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :