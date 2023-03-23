function! db_ui#notifications#info(msg, ...) abort
  echo("edwar")
  call nvim_notify(a:msg, 2, {})
  return
endfunction

function! db_ui#notifications#error(msg, ...) abort
  echo("edwar")
  call nvim_notify(a:msg, 4, {})
  return
endfunction

function! db_ui#notifications#warning(msg, ...) abort
  echo("edwar")
  call nvim_notify(a:msg, 3, {})
  return
endfunction

