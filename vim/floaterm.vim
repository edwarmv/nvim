" **************
" floaterm
" **************
let g:floaterm_height = 0.51 " 0.51
let g:floaterm_width = 1.0
" let g:floaterm_wintype = 'split'
" autocmd VimResized * FloatermUpdate
let g:floaterm_position = 'bottom'
" let g:floaterm_borderchars = '        '
let g:floaterm_borderchars = '─│─│┌┐┘└'
" let g:floaterm_borderchars = '─│─│╭╮╯╰'
" ╭─╮
" │─│
" ╰─╯
" maps *********
let g:floaterm_keymap_new    = '<leader>T'
let g:floaterm_keymap_prev   = '<leader>t['
let g:floaterm_keymap_next   = '<leader>t]'
let g:floaterm_keymap_toggle = '<leader>tt'
let g:floaterm_keymap_kill   = '<leader>tk'

function! FloatermInfo() abort
  let buffers = floaterm#buflist#gather()
  let cnt = len(buffers)
  if cnt == 0 | return '' | endif
  let cur = floaterm#buflist#curr()
  let idx = index(buffers, cur) + 1
  return printf('floaterm %s/%s', idx, cnt)
endfunction

