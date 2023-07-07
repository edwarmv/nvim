let g:zoom#statustext = '[Z]'
let g:zoom_tmux_z = v:false
nmap <leader>z <Plug>(zoom-toggle)

" function! s:ZoomVimLeave()
"   let zoomstatus = zoom#statusline()
"   let obsessionstatus = ObsessionStatus()
"   if zoomstatus != ''
"     if obsessionstatus != ''
"       execute 'Obsession'
"     endif
"     call zoom#toggle()
"     if obsessionstatus != '[S]'
"       execute 'Obsession'
"     endif
"   endif
" endfunction
"
" augroup Zoom
"   au!
"   autocmd VimLeavePre * call s:ZoomVimLeave()
" augroup END
				   " :autocmd VimLeavePre * call CleanupStuff()
