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
badd +3 lib/screens/search_page.dart
badd +1 ./
badd +48 lib/widgets/search_bar.dart
badd +38 lib/screens/main_screen.dart
badd +2 lib/screens/home_page.dart
badd +46 lib/model/resep.dart
badd +1067 ~/Development/flutter/packages/flutter/lib/src/material/list_tile.dart
badd +3 lib/screens/detail_screen.dart
badd +58 lib/widgets/resep_grid.dart
badd +4 lib/widgets/list_bahan.dart
badd +2 lib/screens/favorite_page.dart
badd +90595 output:///flutter-dev
badd +1 macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_16.png
badd +319 ~/Development/flutter/packages/flutter/lib/src/cupertino/text_field.dart
badd +1 ~/Project/dicoding_flutter/buku_resep/README.md
badd +44 ~/Project/dicoding_flutter/buku_resep/pubspec.yaml
badd +27 ~/Project/dicoding_flutter/buku_resep/lib/main.dart
argglobal
%argdel
$argadd ./
edit lib/screens/search_page.dart
argglobal
balt lib/widgets/resep_grid.dart
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
let s:l = 3 - ((2 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 3
normal! 017|
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
