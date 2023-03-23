if exists('*nvim_create_namespace')

    let s:namespace = nvim_create_namespace('custom_hexokinase')
else
    echoerr 'virtual highlighting only works with Neovim v0.3.2 - please upgrade'
    finish
endif

fun! custom_hexokinase#virtual#highlight_cb(bufnr) abort
    for it in getbufvar(a:bufnr, 'hexokinase_colours', [])
        let it['hlname'] = hexokinase#utils#create_fg_hl(it.hex)

        let chunks = [[g:Hexokinase_virtualText, it.hlname]]
        let set_chunks = nvim_buf_get_extmarks(
                \   a:bufnr,
                \   s:namespace,
                \   [it.lnum - 1, 0],
                \   [it.lnum - 1, 0],
                \   {'details': v:true}
                \ )
        if !empty(set_chunks)
            let chunks += set_chunks[0][3].virt_text
            call nvim_buf_set_extmark(
                        \   a:bufnr,
                        \   s:namespace,
                        \   it.lnum - 1,
                        \   0,
                        \   {
                        \       'id': set_chunks[0][0],
                        \       'virt_text': chunks,
                        \       'hl_mode': 'combine',
                        \       'priority': 200,
                        \   }
                        \ )
        else
            call nvim_buf_set_extmark(
                        \   a:bufnr,
                        \   s:namespace,
                        \   it.lnum - 1,
                        \   0,
                        \   {
                        \       'virt_text': chunks,
                        \       'hl_mode': 'combine',
                        \       'priority': 200,
                        \   }
                        \ )
        endif
        " echomsg a:bufnr
        " echomsg s:namespace
        " echomsg it.lnum
        " echomsg "--------------"
        " call nvim_buf_set_extmark(
        "             \   a:bufnr,
        "             \   s:namespace,
        "             \   it.lnum - 1,
        "             \   0,
        "             \   {
        "             \       'virt_text': chunks,
        "             \       'hl_mode': 'combine',
        "             \       'right_gravity': v:true,
        "             \   }
        "             \ )
    endfor
endf

fun! custom_hexokinase#virtual#teardown_cb(bufnr) abort
    if !bufexists(a:bufnr)
        return
    endif

    if exists('*nvim_buf_clear_namespace')
        call nvim_buf_clear_namespace(a:bufnr, s:namespace, 0, -1)
    endif
endf

" fun! hexokinase#highlighters#virtual#highlight(lnum, hex, hl_name, start, end) abort
"     if exists('*nvim_buf_set_virtual_text')
"         let chunks = [[g:Hexokinase_virtualText, a:hl_name]]
"         if exists('*nvim_buf_get_virtual_text')
"             let chunks += nvim_buf_get_virtual_text(bufnr('%'), a:lnum - 1)
"         endif
"         call nvim_buf_set_virtual_text(
"                     \   bufnr('%'),
"                     \   s:namespace,
"                     \   a:lnum - 1,
"                     \   chunks,
"                     \   {}
"                     \ )
"     endif
" endf
"
" fun! hexokinase#highlighters#virtual#tearDown() abort
"     call hexokinase#highlighters#virtual#tearDownv2(bufnr('%'))
" endf
