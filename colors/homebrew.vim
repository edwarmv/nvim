" homebrew.vim -- Vim color scheme.
" Author:      Edwar Martinez (edwarkenedy@icloud.com)
" Webpage:     
" Description: Ported color scheme from macos terminal.
" Last Change: 2021-07-14

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "homebrew"

if ($TERM =~ '256' || &t_Co >= 256) || has("gui_running")
    hi Normal ctermbg=0 ctermfg=NONE cterm=NONE guibg=#000000 guifg=#00ff00 gui=NONE
    hi NonText ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=#00ff00 gui=NONE
    hi Comment ctermbg=NONE ctermfg=2 cterm=NONE guibg=NONE guifg=#00a600 gui=NONE
    hi Constant ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi Error ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi Identifier ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi Ignore ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi PreProc ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi Special ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi Statement ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi String ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=#00ff00 gui=NONE
    hi Todo ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi Type ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi Underlined ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi StatusLine ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi StatusLineNC ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi VertSplit ctermbg=NONE ctermfg=NONE cterm=NONE guibg=#083905 guifg=NONE gui=NONE
    hi TabLine ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi TabLineFill ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi TabLineSel ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi Title ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi CursorLine ctermbg=NONE ctermfg=NONE cterm=NONE guibg=#083905 guifg=NONE gui=NONE
    hi LineNr ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi CursorLineNr ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi helpLeadBlank ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi helpNormal ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi Visual ctermbg=NONE ctermfg=NONE cterm=NONE guibg=#083905 guifg=NONE gui=NONE
    hi VisualNOS ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi Pmenu ctermbg=0 ctermfg=NONE cterm=NONE guibg=#000000 guifg=#00ff00 gui=NONE
    hi PmenuSbar ctermbg=NONE ctermfg=NONE cterm=NONE guibg=#083905 guifg=#00ff00 gui=NONE
    hi PmenuSel ctermbg=NONE ctermfg=NONE cterm=NONE guibg=#083905 guifg=#00ff00 gui=NONE
    hi PmenuThumb ctermbg=NONE ctermfg=NONE cterm=NONE guibg=#00ff00 guifg=#00ff00 gui=NONE
    hi FoldColumn ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi Folded ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi WildMenu ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi SpecialKey ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi DiffAdd ctermbg=NONE ctermfg=2 cterm=NONE guibg=NONE guifg=#00a600 gui=NONE
    hi DiffChange ctermbg=NONE ctermfg=4 cterm=NONE guibg=NONE guifg=#00bfff gui=NONE
    hi DiffDelete ctermbg=NONE ctermfg=1 cterm=NONE guibg=NONE guifg=#ff0000 gui=NONE
    hi DiffText ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi IncSearch ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi Search ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi Directory ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=#00ff00 gui=NONE
    hi MatchParen ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi SpellBad ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE guisp=#f64747
    hi SpellCap ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE guisp=#89c4f4
    hi SpellLocal ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE guisp=#FF00FF
    hi SpellRare ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE guisp=#00ffff
    hi ColorColumn ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi SignColumn ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi ErrorMsg ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi ModeMsg ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi MoreMsg ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi Question ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi Cursor ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi CursorColumn ctermbg=NONE ctermfg=NONE cterm=NONE guibg=#083905 guifg=NONE gui=NONE
    hi QuickFixLine ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi Conceal ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi ToolbarLine ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi ToolbarButton ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi debugPC ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE
    hi debugBreakpoint ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#666666 gui=NONE

elseif &t_Co == 8 || $TERM !~# '^linux' || &t_Co == 16
    set t_Co=16

    hi Normal ctermbg=black ctermfg=NONE cterm=NONE
    hi NonText ctermbg=NONE ctermfg=NONE cterm=NONE
    hi Comment ctermbg=NONE ctermfg=darkgreen cterm=NONE
    hi Constant ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi Error ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi Identifier ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi Ignore ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi PreProc ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi Special ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi Statement ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi String ctermbg=NONE ctermfg=NONE cterm=NONE
    hi Todo ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi Type ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi Underlined ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi StatusLine ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi StatusLineNC ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi VertSplit ctermbg=NONE ctermfg=NONE cterm=NONE
    hi TabLine ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi TabLineFill ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi TabLineSel ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi Title ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi CursorLine ctermbg=NONE ctermfg=NONE cterm=NONE
    hi LineNr ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi CursorLineNr ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi helpLeadBlank ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi helpNormal ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi Visual ctermbg=NONE ctermfg=NONE cterm=NONE
    hi VisualNOS ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi Pmenu ctermbg=black ctermfg=NONE cterm=NONE
    hi PmenuSbar ctermbg=NONE ctermfg=NONE cterm=NONE
    hi PmenuSel ctermbg=NONE ctermfg=NONE cterm=NONE
    hi PmenuThumb ctermbg=NONE ctermfg=NONE cterm=NONE
    hi FoldColumn ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi Folded ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi WildMenu ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi SpecialKey ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi DiffAdd ctermbg=NONE ctermfg=darkgreen cterm=NONE
    hi DiffChange ctermbg=NONE ctermfg=darkblue cterm=NONE
    hi DiffDelete ctermbg=NONE ctermfg=darkred cterm=NONE
    hi DiffText ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi IncSearch ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi Search ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi Directory ctermbg=NONE ctermfg=NONE cterm=NONE
    hi MatchParen ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi SpellBad ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi SpellCap ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi SpellLocal ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi SpellRare ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi ColorColumn ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi SignColumn ctermbg=NONE ctermfg=NONE cterm=NONE
    hi ErrorMsg ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi ModeMsg ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi MoreMsg ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi Question ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi Cursor ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi CursorColumn ctermbg=NONE ctermfg=NONE cterm=NONE
    hi QuickFixLine ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi Conceal ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi ToolbarLine ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi ToolbarButton ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi debugPC ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi debugBreakpoint ctermbg=NONE ctermfg=darkgray cterm=NONE
endif

hi link EndOfBuffer NonText
hi link Number Constant
hi link StatusLineTerm StatusLine
hi link StatusLineTermNC StatusLineNC
hi link WarningMsg Error
hi link CursorIM Cursor
hi link Terminal Normal

let g:terminal_ansi_colors = [ '#000000', '#ff0000', '#00a600', '#d4b300', '#00bfff', '#D252B2', '#34dbdb', '#bfbfbf', '#666666', '#f64747', '#00d900', '#ffd700', '#89c4f4', '#FF00FF', '#00ffff', '#e5e5e5', ]

" Generated with RNB (https://github.com/romainl/vim-rnb)
