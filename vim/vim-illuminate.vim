" **************
" vim-illuminate
" **************
" hi illuminatedWord  ctermbg=242 guibg=#393f4a
" " hi link illuminatedWord Visual
" hi illuminatedCurWord guibg=none
let g:Illuminate_delay = 300
let g:Illuminate_highlightUnderCursor = 1
let g:Illuminate_ftblacklist = ['NvimTree', 'floaterm', 'fzf', 'trouble', '', 'qf', 'DressingInput', 'DressingSelect']

nmap <leader>cW <cmd>IlluminationToggle<cr>

