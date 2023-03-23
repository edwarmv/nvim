" **************
" vim-choosewin
" **************
nmap  -  <Plug>(choosewin)
let g:choosewin_overlay_enable = 0
let g:choosewin_statusline_replace = 1
let g:choosewin_blink_on_land = 0
let g:choosewin_label = 'ABCDEFGIMNOPQRTUVWYZ'
let g:choosewin_keymap = {
  \ '0':      'tab_first',
  \ '[':      'tab_prev',
  \ ']':      'tab_next',
  \ '$':      'tab_last',
  \ 'x':      'tab_close',
  \ ';':      'win_land',
  \ "-": 'previous',
  \ 's':      'swap',
  \ 'S':      'swap_stay',
  \ "\<CR>":  'win_land',
  \}

