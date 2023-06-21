set background=dark
let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_foreground = 'material' " material - mix - original
let g:gruvbox_material_ui_contrast = 'low' " low - high
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_background = 'soft'
let g:gruvbox_material_sign_column_background = 'none' " default none
let g:gruvbox_material_diagnostic_text_highlight = 1
let g:gruvbox_material_diagnostic_line_highlight = 1
let g:gruvbox_material_transparent_background = 0
let g:gruvbox_material_visual = 'grey background'
let g:gruvbox_material_show_eob = 0
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_diagnostic_virtual_text = 'grey' " colored grey
let g:gruvbox_material_current_word = 'grey background'
let g:gruvbox_material_colors_override = { 'bg_dim': ['#32302f', '236'] }
function! s:gruvbox_material_custom() abort
  " Link a highlight group to a predefined highlight group.
  " See `colors/gruvbox-material.vim` for all predefined highlight groups.
  " highlight! link groupA groupB
  " hi link TSString Yellow
  " hi link TSTagAttribute Green
  hi link CmpItemAbbr Comment
  hi link LspFloatWinNormal NormalFloat
  hi link LspSagaCodeActionContent NormalFloat
  hi link DiagnosticLineCol Grey
  " hi link CmpNormal Pmenu
  hi HintFloat cterm=none guibg=none
  hi ErrorFloat cterm=none guibg=none
  hi WarningFloat cterm=none guibg=none
  hi InfoFloat cterm=none guibg=none
  " hi ErrorText gui=none
  " hi WarningText gui=none
  " hi InfoText gui=none
  " hi HintText gui=none

  hi default link FloatermBorder FloatBorder
  " hi default link Floaterm Normal

  " hi default link RnvimrNormal Normal
  " hi default link RnvimrCurses FloatBorder

  hi default link NeoTreeDotfile Comment
  hi default link NeoTreeMessage NonText
  hi default link NeoTreeDimText NonText

  hi! default link MatchWord Visual

  hi! link NullLsInfoBorder FloatBorder

  " hi default link WinBar StatusLine
  " hi default link WinBarNC StatusLineNC

  if &background ==# 'dark'
    " hi Normal guibg=#2f2d2d
    " hi EndOfBuffer guibg=#2f2d2d
    " hi Pmenu guifg=#ddc7a1 guibg=#393735
    " hi PmenuSel guifg=#32302f guibg=#a89984
    " hi NormalFloat guifg=#d4be98 guibg=#393735
    " hi ExtraWhitespace guifg=#665c54 guibg=none

    let g:terminal_color_0 = '#32302f'
    let g:terminal_color_8 = '#928374'
  else
    hi PmenuSel guifg=#4f3829 guibg=#dac9a5
  endif

  " Initialize the color palette.
  " The first parameter is a valid value for `g:gruvbox_material_background`,
  " and the second parameter is a valid value for `g:gruvbox_material_palette`.
  " and the third parameter is a valid value for `g:gruvbox_material_colors_override`.
  let l:palette = gruvbox_material#get_palette('soft', 'material', {})
  " Define a highlight group.
  " The first parameter is the name of a highlight group,
  " the second parameter is the foreground color,
  " the third parameter is the background color,
  " the fourth parameter is for UI highlighting which is optional,
  " and the last parameter is for `guisp` which is also optional.
  " See `autoload/gruvbox_material.vim` for the format of `l:palette`.
  " call gruvbox_material#highlight('groupE', l:palette.red, l:palette.none, 'undercurl', l:palette.red)
  " call gruvbox_material#highlight('NeoTreeGitConflict', l:palette.orange, l:palette.none, 'bold,italic')
  " call gruvbox_material#highlight('NeoTreeGitUntracked', l:palette.orange, l:palette.none, 'italic')

  call gruvbox_material#highlight('MasonHighlightBlock', l:palette.bg0, l:palette.blue)
  call gruvbox_material#highlight('MasonLink', l:palette.blue, l:palette.none)
  call gruvbox_material#highlight('MasonHighlight', l:palette.blue, l:palette.none)
  call gruvbox_material#highlight('MasonHighlightBlockBold', l:palette.bg0, l:palette.blue, 'bold')
  call gruvbox_material#highlight('MasonHighlightBlockBoldSecondary', l:palette.bg0, l:palette.orange, 'bold')
  call gruvbox_material#highlight('MasonHighlightBlockSecondary', l:palette.bg0, l:palette.orange)
  call gruvbox_material#highlight('MasonHighlightSecondary', l:palette.orange, l:palette.none)
  call gruvbox_material#highlight('MasonHeader', l:palette.bg0, l:palette.orange, 'bold')
  call gruvbox_material#highlight('MasonHeaderSecondary', l:palette.bg0, l:palette.blue, 'bold')
  call gruvbox_material#highlight('MasonError', l:palette.red, l:palette.none)
  call gruvbox_material#highlight('MasonMuted', l:palette.grey1, l:palette.none)
  call gruvbox_material#highlight('MasonHeading', l:palette.fg0, l:palette.none, 'bold')
  call gruvbox_material#highlight('MasonMutedBlock', l:palette.bg0, l:palette.grey1)
  call gruvbox_material#highlight('MasonMutedBlockBold', l:palette.bg0, l:palette.grey1, 'bold')
  call gruvbox_material#highlight('MasonNormal', l:palette.fg0, l:palette.none)

  " call gruvbox_material#highlight('LspFloatWinNormal', l:palette.fg1, l:palette.none)
  " call gruvbox_material#highlight('LspSagaCodeActionContent', l:palette.fg1, l:palette.none)

  " call gruvbox_material#highlight('CmpItemAbbrDeprecated', l:palette.grey1, l:palette.none, 'strikethrough')
  call gruvbox_material#highlight('EndOfBuffer', l:palette.bg4, l:palette.none)
  call gruvbox_material#highlight('CurrentWord', l:palette.none, l:palette.none, 'underline')
  call gruvbox_material#highlight('ExtraWhitespace', l:palette.red, l:palette.bg_visual_red)

  " call gruvbox_material#highlight('FloatermBorder', l:palette.fg1, l:palette.bg4)
  call gruvbox_material#highlight('Floaterm', l:palette.fg1, l:palette.none)
  call gruvbox_material#highlight('Terminal', l:palette.fg1, l:palette.none)

  " call gruvbox_material#highlight('MatchParen', l:palette.none, l:palette.)

  call gruvbox_material#highlight('DiagnosticDeprecated', l:palette.none, l:palette.none, 'strikethrough', l:palette.red)
  call gruvbox_material#highlight('DiagnosticError', l:palette.red, l:palette.none)
  call gruvbox_material#highlight('DiagnosticWarn', l:palette.yellow, l:palette.none)
  call gruvbox_material#highlight('DiagnosticInfo', l:palette.blue, l:palette.none)
  call gruvbox_material#highlight('DiagnosticHint', l:palette.green, l:palette.none)
  " call gruvbox_material#highlight('DiagnosticUnderlineError', l:palette.red, l:palette.bg_visual_red, "undercurl")
  " call gruvbox_material#highlight('DiagnosticUnderlineHint', l:palette.green, l:palette.bg_visual_green, "undercurl")
  " call gruvbox_material#highlight('DiagnosticUnderlineInfo', l:palette.blue, l:palette.bg_visual_blue, "undercurl")
  " call gruvbox_material#highlight('DiagnosticUnderlineWarn', l:palette.yellow, l:palette.bg_visual_yellow, "undercurl")

  call gruvbox_material#highlight('HydraRed', l:palette.red, l:palette.none)
  call gruvbox_material#highlight('HydraBlue', l:palette.blue, l:palette.none)
  call gruvbox_material#highlight('HydraAmaranth', l:palette.orange, l:palette.none)
  call gruvbox_material#highlight('HydraTeal', l:palette.green, l:palette.none)
  call gruvbox_material#highlight('HydraPink', l:palette.purple, l:palette.none)

  call gruvbox_material#highlight('LightBulbVirtualText', l:palette.green, l:palette.none)
  if &background ==# 'dark'
    " call gruvbox_material#highlight('RnvimrCurses', l:palette.bg4, l:palette.bg4)

    call gruvbox_material#highlight('DiagnosticLineNrError', l:palette.red, l:palette.none)
    call gruvbox_material#highlight('DiagnosticLineNrWarn', l:palette.yellow, l:palette.none)
    call gruvbox_material#highlight('DiagnosticLineNrInfo', l:palette.blue, l:palette.none)
    call gruvbox_material#highlight('DiagnosticLineNrHint', l:palette.green, l:palette.none)
    " call gruvbox_material#highlight('DiagnosticLineNrError', l:palette.red, l:palette.bg_visual_red)
    " call gruvbox_material#highlight('DiagnosticLineNrWarn', l:palette.yellow, l:palette.bg_visual_yellow)
    " call gruvbox_material#highlight('DiagnosticLineNrInfo', l:palette.blue, l:palette.bg_visual_blue)
    " call gruvbox_material#highlight('DiagnosticLineNrHint', l:palette.green, l:palette.bg_visual_green)

    " call gruvbox_material#highlight('LspFloatWinNormal', l:palette.fg1, l:palette.bg4)

    " call gruvbox_material#highlight('LspSagaCodeActionTruncateLine', l:palette.fg1, l:palette.bg4)
    " call gruvbox_material#highlight('LspSagaCodeActionContent', l:palette.fg1, l:palette.bg4)

    call gruvbox_material#highlight('FloatTitle', l:palette.fg1, l:palette.none)
    call gruvbox_material#highlight('FloatBorder', l:palette.grey1, l:palette.none)
    call gruvbox_material#highlight('NormalFloat', l:palette.fg1, l:palette.none)

    call gruvbox_material#highlight('RnvimrNormal', l:palette.fg0, l:palette.bg0)
    call gruvbox_material#highlight('RnvimrCurses', l:palette.grey1, l:palette.none)
    " call gruvbox_material#highlight('RnvimrCurses', l:palette.bg3, l:palette.bg3)

    " call gruvbox_material#highlight('NnnNormal', l:palette.fg1, l:palette.bg3)
    " call gruvbox_material#highlight('NnnBorder', l:palette.bg3, l:palette.bg3)

    " call gruvbox_material#highlight('FloatBorder', l:palette.bg3, l:palette.bg3)

    call gruvbox_material#highlight('VertSplit', l:palette.bg5, l:palette.bg_statusline1)
    call gruvbox_material#highlight('Cursor', l:palette.bg0, l:palette.grey2)
    " call gruvbox_material#highlight('NnnBorder', l:palette.bg4, l:palette.bg4)
  else
    call gruvbox_material#highlight('VertSplit', l:palette.bg4, l:palette.bg4)
  endif

  call gruvbox_material#highlight('DiffAdd', l:palette.none, l:palette.bg_visual_blue)
  call gruvbox_material#highlight('DiffChange', l:palette.none, l:palette.bg_visual_green)
  call gruvbox_material#highlight('DiffDelete', l:palette.none, l:palette.bg_visual_red)

  " call gruvbox_material#highlight('CmpItemAbbrMatch', l:palette.blue, l:palette.none, 'bold')
  " call gruvbox_material#highlight('CmpItemAbbrMatchFuzzy', l:palette.green, l:palette.none, 'bold')
  " call gruvbox_material#highlight('CmpNormal', l:palette.green, l:palette.none, 'bold')

  call gruvbox_material#highlight('HopNextKey', l:palette.green, l:palette.bg0, 'bold')
  call gruvbox_material#highlight('HopNextKey1', l:palette.green, l:palette.bg0, 'bold')
  call gruvbox_material#highlight('HopNextKey2', l:palette.green, l:palette.bg0, 'bold')
  call gruvbox_material#highlight('HopPreview', l:palette.green, l:palette.bg0, 'bold')
  " call gruvbox_material#highlight('HopUnmatched', l:palette.grey1, l:palette.bg0, 'bold')
  " call gruvbox_material#highlight('HopCursor', l:palette.green, l:palette.bg0, 'bold')

  call gruvbox_material#highlight('LeapMatch', l:palette.green, l:palette.bg0, 'nocombine,underline,bold')
  call gruvbox_material#highlight('LeapLabelPrimary', l:palette.bg_statusline2, l:palette.green, 'nocombine,bold')
  call gruvbox_material#highlight('LeapLabelSecondary', l:palette.bg_statusline2, l:palette.blue, 'nocombine,bold')
  call gruvbox_material#highlight('LeapLabelSelected', l:palette.bg_statusline2, l:palette.purple, 'nocombine,bold')
  call gruvbox_material#highlight('LeapBackdrop', l:palette.grey1, l:palette.bg0)

  call gruvbox_material#highlight('LightspeedLabel', l:palette.red, l:palette.none, 'underline')
  call gruvbox_material#highlight('LightspeedLabelDistant', l:palette.blue, l:palette.none, 'underline')
  call gruvbox_material#highlight('LightspeedShortcut', l:palette.bg0, l:palette.red)
  call gruvbox_material#highlight('LightspeedUnlabeledMatch', l:palette.fg0, l:palette.none)
  call gruvbox_material#highlight('LightspeedPendingOpArea', l:palette.bg0, l:palette.green)

  " call gruvbox_material#highlight('LightspeedLabel', l:palette.bg0, l:palette.fg0, 'bold')
  " call gruvbox_material#highlight('LightspeedLabelDistant', l:palette.bg0, l:palette.blue, 'bold')
  " call gruvbox_material#highlight('LightspeedShortcut', l:palette.bg0, l:palette.green, 'bold')
  " call gruvbox_material#highlight('LightspeedMaskedChar', l:palette.bg0, l:palette.purple, 'bold')
  " call gruvbox_material#highlight('LightspeedGreyWash', l:palette.none, l:palette.none)
  " call gruvbox_material#highlight('LightspeedUnlabeledMatch', l:palette.bg0, l:palette.aqua, 'bold')
  " call gruvbox_material#highlight('LightspeedOneCharMatch', l:palette.bg0, l:palette.orange, 'bold')
  " call gruvbox_material#highlight('LightspeedPendingOpArea', l:palette.bg0, l:palette.orange, 'bold')
  " call gruvbox_material#highlight('LightspeedCursor', l:palette.none, l:palette.none, 'reverse')

  call gruvbox_material#highlight('javascriptParens', l:palette.fg0, l:palette.none)
  call gruvbox_material#highlight('javascriptComma', l:palette.fg0, l:palette.none)
  call gruvbox_material#highlight('javascriptOpSymbol', l:palette.fg0, l:palette.none)
  call gruvbox_material#highlight('typescriptParens', l:palette.fg0, l:palette.none)

  call gruvbox_material#highlight('CocErrorLine', l:palette.none, l:palette.none)
  call gruvbox_material#highlight('CocWarningLine', l:palette.none, l:palette.none)
  call gruvbox_material#highlight('CocHintLine', l:palette.none, l:palette.none)
  call gruvbox_material#highlight('CocInfoLine', l:palette.none, l:palette.none)

  call gruvbox_material#highlight('CocSuggestFloating', l:palette.fg0, l:palette.bg3)

  call gruvbox_material#highlight('TelescopeResultsNormal', l:palette.grey1, l:palette.none)

  call gruvbox_material#highlight('NvimTreeWindowPicker', l:palette.fg1, l:palette.bg_statusline1)

  call gruvbox_material#highlight('InclineNormal', l:palette.fg0, l:palette.bg3)

  call gruvbox_material#highlight('WinBar', l:palette.fg0, l:palette.bg_statusline1)
  call gruvbox_material#highlight('WinBarNC', l:palette.grey1, l:palette.bg_statusline1)

  endfunction

  augroup GruvboxMaterialCustom
    autocmd!
    autocmd ColorScheme gruvbox-material call s:gruvbox_material_custom()
  augroup END

  colorscheme gruvbox-material
