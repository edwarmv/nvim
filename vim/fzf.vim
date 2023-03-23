" **************
" fzf
" **************
" hi default link fzf Normal
" hi fzf guifg=#d4be98 guibg=#32302f
let g:fzf_colors = {
\ 'bg': ['bg', 'NormalFloat'],
\ 'border': ['fg', 'FloatBorder'],
\}
" let g:fzf_colors = {
" \ 'bg': ['bg', 'Normal'],
" \ 'bg+': ['bg', 'CursorLine'],
" \ 'border': ['fg', 'FloatBorder'],
" \ 'preview-bg': ['bg', 'Normal'],
" \}
" let g:fzf_colors = {
" \ 'bg': ['bg', 'Normal'],
" \ 'bg+': ['bg', 'CursorLine'],
" \}

" function! s:fzf_statusline()
"   " Override statusline as you like
"   highlight fzf1 ctermfg=161 ctermbg=251
"   highlight fzf2 ctermfg=23 ctermbg=251
"   highlight fzf3 ctermfg=237 ctermbg=251
"   setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
" endfunction

" function! s:fzf_statusline()
" endfunction

" autocmd! User FzfStatusLine call <SID>fzf_statusline()

" if exists('$TMUX')
"   let g:fzf_layout = { 'tmux': '-w 100% -h 50% -y P --border=sharp --margin 0,0' }
" else
"   let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 0.5, 'border': 'sharp', 'yoffset': 1.00, 'relative': v:false } }
" endif
" let g:fzf_layout = { 'down': '50%' }

" let g:fzf_preview_window = ['right:50%', 'ctrl-l']
" let g:fzf_preview_window = ['right:50%']
" let g:fzf_buffers_jump = 1
" let g:fzf_action = {
"   \ 'ctrl-t': 'tab split',
"   \ 'ctrl-s': 'split',
"   \ 'ctrl-v': 'vsplit' }

" command! -bang FilesRelativePath
"   \ call fzf#vim#files(expand('%:p:h'), fzf#vim#with_preview(), <bang>0)
" command! -bang BuffersRelativePath
"   \ call fzf#vim#buffers(expand('%:h'), fzf#vim#with_preview(), <bang>0)

" function! s:list_buffers()
"   redir => list
"   silent ls
"   redir END
"   return split(list, "\n")
" endfunction

" function! s:delete_buffers(lines)
"   execute 'bdelete' join(map(a:lines, {_, line -> split(line)[0]}))
" endfunction

" command! BufferDelete
"   \ call fzf#run(
"   \   fzf#wrap({
"   \     'source': s:list_buffers(),
"   \     'sink*': { lines -> s:delete_buffers(lines) },
"   \     'options': "--preview"
"   \   })
"   \)

function! s:shortpath()
  let short = fnamemodify(getcwd(), ':~:.')
  if !has('win32unix')
    let short = pathshorten(short)
  endif
  let slash = '/'
  return empty(short) ? '~'.slash : short . (short =~ escape(slash, '\').'$' ? '' : slash)
endfunction

function! s:get_dir()
  let dir = s:shortpath()
  return strwidth(dir) < &columns / 2 - 20 ? dir : '> '
endfunction

command! -bang -complete=dir -nargs=? Find call fzf#run(fzf#vim#with_preview(fzf#wrap({ 'source': 'find . -type f', 'dir': <q-args>, 'options': ['--prompt', s:get_dir()] }, <bang>0)))

" maps *********
" nmap <silent><space>ff                <cmd>Files<CR>
" nmap <silent><space><space>ff         <cmd>Find<CR>
" nmap <silent><space>fF                <cmd>FilesRelativePath<CR>
" nmap <silent><space>fb                <cmd>Buffers<CR>
" nmap <silent><space>fB                <cmd>BuffersRelativePath<CR>
" nmap <silent><space>fh                <cmd>History<CR>
" nmap <silent><space><space>fl         <cmd>BLines<CR>
" nmap <silent><space><space>fL         <cmd>Lines<CR>
" nmap <silent><space>fg                <cmd>GFiles<CR>
" nmap <silent><space>fG                <cmd>GFiles?<CR>
" nmap <silent><space><space>fb          <cmd>BufferDelete<CR>

" nmap <silent><space>fld         <cmd>Diagnostics<CR>
" nmap <silent><space>flD         <cmd>DiagnosticsAll<CR>
" nmap <silent><space>fls         <cmd>DocumentSymbols<CR>

" nmap <silent><space>fld         <cmd>FzfLua lsp_document_diagnostics<CR>
" nmap <silent><space>flD         <cmd>FzfLua lsp_workspace_diagnostics<CR>
" nmap <silent><space>fls         <cmd>FzfLua lsp_document_symbols<CR>

" nmap <silent><space>fk         <cmd>Maps<CR>
" nmap <silent><space>fm         <cmd>Marks<CR>
" nmap <silent><space>fa         <cmd>Ag<CR>
" nmap <silent><space>fr         <cmd>Rg<CR>
" nmap <silent><space>fc         <cmd>Commands<CR>

" function! s:fzf_statusline()
"   " Override statusline as you like
"   highlight fzf1 ctermfg=161 ctermbg=251
"   highlight fzf2 ctermfg=23 ctermbg=251
"   highlight fzf3 ctermfg=237 ctermbg=251
"   setlocal statusline=%#lualine_a_normal#\ FZF\ %#StatusLine#
" endfunction

" autocmd! User FzfStatusLine call <SID>fzf_statusline()
