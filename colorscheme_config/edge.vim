set background=light
function! s:edge_custom() abort
  " Link a highlight group to a predefined highlight group.
  " See `colors/edge.vim` for all predefined highlight groups.
  hi! link CmpItemAbbr Comment
  hi HintFloat cterm=none guibg=none
  hi ErrorFloat cterm=none guibg=none
  hi WarningFloat cterm=none guibg=none
  hi InfoFloat cterm=none guibg=none

  " Initialize the color palette.
  " The parameter is a valid value for `g:edge_style`,
  let l:palette = edge#get_palette('aura')
  " Define a highlight group.
  " The first parameter is the name of a highlight group,
  " the second parameter is the foreground color,
  " the third parameter is the background color,
  " the fourth parameter is for UI highlighting which is optional,
  " and the last parameter is for `guisp` which is also optional.
  " See `autoload/edge.vim` for the format of `l:palette`.
  if &background ==# 'light'
    let g:terminal_color_0 = '#fafafa'
    let g:terminal_color_8 = '#8790a0'
    
    let g:terminal_color_1 = '#d05858'
    let g:terminal_color_9 = '#ee7676'
    
    let g:terminal_color_2 = '#608e32'
    let g:terminal_color_10 = '#7ea850'
    
    let g:terminal_color_3 = '#be7e05'
    let g:terminal_color_11 = '#dc9c23'
    
    let g:terminal_color_4 = '#5079be'
    let g:terminal_color_12 = '#6e97dc'
    
    let g:terminal_color_5 = '#b05ccc'
    let g:terminal_color_13 = '#ce7aea'
    
    let g:terminal_color_6 = '#3a8b84'
    let g:terminal_color_14 = '#58a9a2'
    
    let g:terminal_color_7 = '#4b505b'
    let g:terminal_color_15 = '#4b505b'

  endif
  " call gruvbox_material#highlight('VertSplit', l:palette.bg4, l:palette.bg4)
  " call gruvbox_material#highlight('PmenuSel', l:palette.fg, l:palette.bg4)

  call gruvbox_material#highlight('LightBulbVirtualText', l:palette.green, l:palette.none)

  call gruvbox_material#highlight('CmpItemAbbrMatch', l:palette.fg, l:palette.none)
  call gruvbox_material#highlight('CmpItemAbbrMatchFuzzy', l:palette.fg, l:palette.none)

  call gruvbox_material#highlight('LightspeedLabel', l:palette.green, l:palette.none, 'underline,bold')
  call gruvbox_material#highlight('LightspeedLabelOverlapped', l:palette.green, l:palette.none, 'underline')
  call gruvbox_material#highlight('LightspeedLabelDistant', l:palette.blue, l:palette.none, 'underline,bold')
  call gruvbox_material#highlight('LightspeedLabelDistantOverlapped', l:palette.blue, l:palette.none, 'underline')
  call gruvbox_material#highlight('LightspeedShortcut', l:palette.bg0, l:palette.green, 'underline,bold')
  call gruvbox_material#highlight('LightspeedShortcutOverlapped', l:palette.bg0, l:palette.green, 'bold')
  call gruvbox_material#highlight('LightspeedMaskedChar', l:palette.purple, l:palette.none, 'bold')
  call gruvbox_material#highlight('LightspeedUnlabeledMatch', l:palette.fg, l:palette.none, 'bold')
  call gruvbox_material#highlight('LightspeedOneCharMatch', l:palette.bg0, l:palette.cyan, 'bold')
  call gruvbox_material#highlight('LightspeedPendingOpArea', l:palette.bg0, l:palette.cyan)
  call gruvbox_material#highlight('LightspeedGreyWash', l:palette.grey, l:palette.none)
  call gruvbox_material#highlight('LightspeedCursor', l:palette.none, l:palette.none, 'reverse')

  call gruvbox_material#highlight('NnnBorder', l:palette.bg2, l:palette.bg2)

  call gruvbox_material#highlight('javascriptParens', l:palette.fg, l:palette.none)
  call gruvbox_material#highlight('javascriptComma', l:palette.fg, l:palette.none)
  call gruvbox_material#highlight('javascriptOpSymbol', l:palette.fg, l:palette.none)
  call gruvbox_material#highlight('typescriptParens', l:palette.fg, l:palette.none)
endfunction

augroup EdgeCustom
  autocmd!
  autocmd ColorScheme edge call s:edge_custom()
augroup END
colorscheme edge
