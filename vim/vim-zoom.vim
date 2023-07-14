let g:zoom#statustext = '[Z]'
let g:zoom_tmux_z = v:false
nmap <leader>z <Plug>(zoom-toggle)

function! s:ZoomVimLeave()
	" let zoomstatus = zoom#statusline()
	" let obsessionstatus = ObsessionStatus()
	" if zoomstatus != ''
	"   if obsessionstatus != ''
	"     execute 'Obsession'
	"   endif
	"   call zoom#toggle()
	"   if obsessionstatus != '[S]'
	"     execute 'Obsession'
	"   endif
	" endif
	let zoomstatus = zoom#statusline()
	echomsg 'pre'
	" if zoomstatus != ''
	" 	execute 'NvimSeparatorShow'
	" else
	" 	execute 'NvimSeparatorDel'
	" endif
	" execute 'NvimSeparatorDel'
endfunction

" augroup Zoom
" 	au!
" augroup END
" autocmd User ZoomPre execute 'NvimSeparatorDel'
" autocmd User ZoomPost execute 'NvimSeparatorShow'
	" autocmd User ZoomPre echomsg 'pre'
	" autocmd User ZoomPost echomsg 'post'
" :autocmd VimLeavePre * call CleanupStuff()
