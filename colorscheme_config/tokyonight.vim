let g:tokyonight_style = "storm"
let g:tokyonight_lualine_bold = 1
colorscheme tokyonight

hi javascriptComma guifg=#c0caf5
hi javascriptOpSymbol guifg=#c0caf5
hi javascriptParens guifg=#c0caf5

hi typescriptParens guifg=#c0caf5

hi VertSplit cterm=reverse guifg=#1f2335 guibg=#1f2335

hi Pmenu ctermfg=14 ctermbg=13 guifg=#565f89 guibg=#1f2335
hi PmenuSel guifg=#1d202f guibg=#73daca

hi CmpItemAbbr ctermfg=14 guifg=#565f89

hi LightspeedLabel gui=bold,underline guifg=#73daca
hi LightspeedLabelOverlapped gui=underline guifg=#73daca
hi LightspeedLabelDistant gui=bold,underline guifg=#9ece6a
hi LightspeedLabelDistantOverlapped gui=underline guifg=#9ece6a
hi LightspeedShortcut gui=bold,underline guifg=#1d202f guibg=#73daca
hi LightspeedShortcutOverlapped gui=bold guifg=#1d202f guibg=#73daca
hi LightspeedMaskedChar gui=bold guifg=#73daca
hi LightspeedGreyWash guifg=#565f89
hi LightspeedUnlabeledMatch gui=bold guifg=#e0af68
hi LightspeedOneCharMatch gui=bold guifg=#1d202f guibg=#73daca
hi LightspeedPendingOpArea guifg=#1d202f guibg=#73daca
hi link LightspeedCursor Cursor

hi HopNextKey  cterm=bold gui=bold guifg=#1d202f guibg=#73daca
hi HopNextKey1 cterm=bold gui=bold guifg=#1d202f guibg=#73daca
hi HopNextKey2 cterm=bold gui=bold guifg=#1d202f guibg=#73daca
hi HopUnmatched guifg=#565f89

highlight link ConflictMarkerOurs DiffChange
highlight link ConflictMarkerTheirs DiffAdd

hi NnnBorder guifg=#1f2335 guibg=#1f2335

let g:choosewin_color_other = {
  \ 'gui': ['#1f2335' ],
  \}
let g:choosewin_color_label_current = {
  \ 'gui': ['#73daca', '#1d202f', 'bold'],
  \}
let g:choosewin_color_label = {
  \ 'gui': ['#3b4261', '#7aa2f7', 'bold'],
  \}
