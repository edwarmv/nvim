let g:polyglot_disabled = ['autoindent', 'sensible', 'ftdetect']
" =========================================================
" vim-settings
" =========================================================
" let &t_Cs = "\e[4:3m"
" let &t_Ce = "\e[4:0m"
let g:python3_host_prog = expand('~') . '/.asdf/shims/python3'
" set jumpoptions="view"
" set lazyredraw
" set nostartofline
" set sidescrolloff=10
" set scrolloff=5
set splitkeep=screen
set splitbelow
set splitright
" set noequalalways
set mouse=a
set mousemodel=extend
set noshowmode  " No mostrar el modo actual (ya lo muestra la barra de estado)
set list " Muestra los espacios, tabs
set termguicolors
set ignorecase
set smartcase
set shortmess+=I " Disable intro message
set cursorline
set cursorcolumn
set signcolumn=yes:1
" set signcolumn=auto:1
" set number
set numberwidth=1
set nowrap
" set linebreak
" set showbreak=…
" set breakindent " indent wrap
set display="msgsep"
" set notimeout
" https://github.com/sindrets/diffview.nvim/issues/35
set fillchars+=diff:╱
" set noshowcmd
" set cmdheight=0

" set sessionoptions=buffers,curdir,tabpages,winsize,winpos
set foldmethod=manual
set foldcolumn=auto

nmap <c-w>t <cmd>tabe %<cr>

" function FocusFloatingWindow()
"   let window_count = winnr('$')
"   execute window_count . "wincmd w"
" endfunction

" nmap <leader><leader>f <cmd>call FocusFloatingWindow()<cr>

nmap <m-H> <c-w>h
nmap <m-J> <c-w>j
nmap <m-K> <c-w>k
nmap <m-L> <c-w>l
imap <c-b> <left>
imap <c-f> <right>
imap <c-n> <down>
imap <c-p> <up>
cnoremap <c-a> <c-b>
cnoremap <c-l> <c-f>
cmap <c-b> <left>
cmap <c-f> <right>

" nnoremap <leader>1 1gt
" nnoremap <leader>2 2gt
" nnoremap <leader>3 3gt
" nnoremap <leader>4 4gt
" nnoremap <leader>5 5gt
" nnoremap <leader>6 6gt
" nnoremap <leader>7 7gt
" nnoremap <leader>8 8gt
" nnoremap <leader>9 9gt
nnoremap ]t gt
nnoremap [t gT
nmap <leader>tn <cmd>$tabnew<cr>
nmap <leader>tm :tabmove 
nmap <leader>tc <cmd>tabclose<cr>
nmap <leader>to <cmd>tabonly<cr>
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <m-6> :exe "tabn ".g:lasttab<cr>

function MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s ..= '%#TabLineSel#'
    else
      let s ..= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    let s ..= '%' .. (i + 1) .. 'T'

    " the label is made by MyTabLabel()
    " let s ..= '%{MyTabLabel(' .. (i + 1) .. ')}' .. ' '


    let s ..= ' '
    let s ..= i + 1
    " let s ..= i + 1 == tabpagenr() ? ' ' : ' '
    let s ..= ' '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s ..= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  " if tabpagenr('$') > 1
  "   let s ..= '%=%#TabLine#%999Xclose'
  " endif

  return s
endfunction

function MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  return winnr
endfunction

set tabline=%!MyTabLine()

" nmap <m-s> <cmd>w<cr>
" vmap <m-s> <cmd>w<cr>
" imap <m-s> <cmd>w<cr>
"
" nmap <m-S> <cmd>wa<cr>
" vmap <m-S> <cmd>wa<cr>
" imap <m-S> <cmd>wa<cr>
"
" nmap <m-w> <cmd>bd<cr>
" vmap <m-w> <cmd>bd<cr>
" imap <m-w> <cmd>bd<cr>
"
" nmap <m-W> <cmd>bufdo bd<cr>
" vmap <m-W> <cmd>bufdo bd<cr>
" imap <m-W> <cmd>bufdo bd<cr>
"{{{
" nnoremap <silent> zh :call HorizontalScrollMode('h')<CR>
" nnoremap <silent> zl :call HorizontalScrollMode('l')<CR>
" nnoremap <silent> zH :call HorizontalScrollMode('H')<CR>
" nnoremap <silent> zL :call HorizontalScrollMode('L')<CR>
"
" function! HorizontalScrollMode( call_char )
"     if &wrap
"         return
"     endif
"
"     execute 'IndentBlanklineDisable'
"
"     echohl Title
"     let typed_char = a:call_char
"     while index( [ 'h', 'l', 'H', 'L' ], typed_char ) != -1
"         execute 'normal! z'.typed_char
"         redraws
"         echon '-- Horizontal scrolling mode (h/l/H/L)'
"         let typed_char = nr2char(getchar())
"     endwhile
"
"     execute 'IndentBlanklineEnable'
"
"     echohl None | echo '' | redraws
" endfunction
"}}}

" autocmd VimEnter * :let @/ = ""

" search under the cursor and keep their position
" https://stackoverflow.com/questions/4256697/vim-search-and-highlight-but-do-not-jump
" nmap <silent> <leader>hl :let @/=expand('<cword>') <bar> set hls <cr>
" nmap <silent> <leader>hn <cmd>noh<cr>
" nnoremap <leader><leader>h <cmd>nohl<cr>

" *************
" for lsp
" *************
set nobackup
set nowritebackup
set hidden
set shortmess+=c
set completeopt=menu,menuone,noselect " compe
" set encoding=utf-8
set updatetime=300
set pumheight=6
set wildoptions=tagfile " Pmenu in statusline

" *************
" Spaces & Tabs
" *************
set tabstop=8     " number of visual spaces per TAB
set softtabstop=-1   " number of spaces in tab when editing - previous value 0
set shiftwidth=2    " number of spaces to use for autoindent
set expandtab       " tabs are space
set copyindent
set smarttab
" set smartindent
set autoindent
set cinkeys=
filetype indent on
set viewoptions=folds,cursor
" no autocomments
" set indentkeys=!^F
" set formatoptions=tcqj
" autocmd BufEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o indentkeys=!^F

autocmd BufEnter * setlocal formatoptions=cqjr/ indentkeys=!^F
autocmd TermOpen * setlocal signcolumn=no nocursorcolumn nocursorline nonumber
autocmd CmdwinEnter * setlocal nonumber signcolumn=no

" disable because tree-sitter errors
" nnoremap = <nop>
" vnoremap = <nop>
" vnoremap gq <nop>
inoremap <c-l> <c-f>
" vnoremap p P
" vnoremap P p
" nmap <F1> <nop>
" imap <F1> <nop>

" =========================================================
" colors cheme config
" =========================================================
syntax on
set termguicolors
" autocmd BufRead * syn sync fromstart
" source ~/.config/nvim/colorscheme_config/tokyonight.vim
" source ~/.config/nvim/colorscheme_config/gruvbox-material.vim
" source ~/.config/nvim/colorscheme_config/edge.vim

au BufRead,BufNewFile Podfile set filetype=ruby

      " \ 'hexokinase.vim',
let s:core_conf_files = [
      \ 'gruvbox-material.vim',
      \ 'vim-markdown.vim',
      \ 'winresizer.vim',
      \ 'vim-visual-multi.vim',
      \ 'emmet-vim.vim',
      \ 'vim-netrw.vim',
      \ 'matchup.vim',
      \ 'zoom.vim',
      \ 'fzf.vim',
      \ ]

for s:fname in s:core_conf_files
  execute printf('source %s/vim/%s', stdpath('config'), s:fname)
endfor

" =========================================================
" Plugins config
" =========================================================

" **************
" lspconfig
" **************
" nnoremap <silent> gr                    <cmd>lua vim.lsp.buf.rename()<CR>
" nnoremap <silent> gd                    <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> <c-s>                 <cmd>lua vim.lsp.buf.signature_help()<CR>
" inoremap <silent> <c-s>                 <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> <leader>ca            <cmd>lua vim.lsp.buf.code_action()<CR>
" nnoremap <silent> gD                     <cmd>lua vim.lsp.buf.declaration()<CR>
" nnoremap <silent> gR                    <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent> gi                    <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> K                     <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> <leader>d             <cmd>lua vim.diagnostic.open_float({ border = 'single' })<CR>
" nnoremap <silent> <leader>q             <cmd>lua vim.diagnostic.setloclist()<CR>
" nnoremap <silent> ]d                    <cmd>lua vim.diagnostic.goto_next({ float = { border = 'single' }})<CR>
" nnoremap <silent> [d                    <cmd>lua vim.diagnostic.goto_prev({ float = { border = 'single' }})<CR>
" nnoremap <silent> <leader>f             <cmd>lua vim.lsp.buf.formatting()<CR>
" vnoremap <silent> <leader>f             <cmd>lua vim.lsp.buf.formatting()<CR>
" nnoremap <silent> <leader>wa            <cmd>lua vim.lsp.buf.add_workspace_folder()<CR>
" nnoremap <silent> <leader>wr            <cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>
" nnoremap <silent> <leader>wl            <cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>

" autocmd BufRead * autocmd FileType <buffer> ++once
"   \ if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif

lua require('init')
" vim: foldmethod=marker
