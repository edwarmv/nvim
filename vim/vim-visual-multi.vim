" ****************
" vim-visual-multi
" ****************
nnoremap <silent> <Plug>(VM-Exit) <cmd>call vm#reset()<cr>
let g:VM_mouse_mappings = 1
let g:VM_show_warnings = 0
let g:VM_set_statusline = 1
let g:VM_silent_exit = 0
" ref: https://github.com/mg979/vim-visual-multi/issues/12#issuecomment-410577960
let g:VM_cmdheight=1
let g:VM_manual_infoline=1
" let g:VM_disable_syntax_in_imode = 1
" let g:VM_use_first_cursor_in_line = 1

function! VM_Start()
  lua require('lualine').hide({ place = { 'statusline' } })
  nmap <buffer> <leader>e <cmd>VMClear<cr>
  execute("IndentBlanklineDisable")
  " execute("NoiceDisable")
endfunction

function! VM_Exit()
  lua require('lualine').hide({unhide=true})
  lua require("nvim-autopairs").force_attach()
  noh
  execute("IndentBlanklineEnable")
  " execute("NoiceEnable")
  " execute("VMClear")
  " call vm#clearmatches()
endfunction

let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<M-d>'
let g:VM_maps['Find Subword Under'] = '<M-d>'
let g:VM_maps["Select Cursor Down"] = '<M-J>'
let g:VM_maps["Select Cursor Up"]   = '<M-K>'

