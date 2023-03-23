" **************
" vim-vsnip
" **************
" let g:vsnip_snippet_dir = expand('~/.local/share/nvim/site/pack/packer/start/friendly-snippets/snippets')
" let g:vsnip_snippet_dirs = [expand('~/.local/share/nvim/site/pack/packer/start/friendly-snippets/snippets/javascript')]
" " let g:vsnip_namespace = '~'
let g:vsnip_filetypes = {}
" let g:vsnip_filetypes.typescript = ['javascript']
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.javascript = ['javascriptreact']
let g:vsnip_filetypes.typescriptreact = ['typescript', 'javascriptreact']
" Expand
" imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
" smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" " Expand or jump
" imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
" smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" " Jump forward or backward
" imap <expr> <m-j>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<c-j>'
" smap <expr> <m-j>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<c-j>'
" imap <expr> <m-k>   vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<c-k>'
" smap <expr> <m-k>   vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<c-k>'
"
" imap <expr> <m-p>   vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : ''
" smap <expr> <m-p>   vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : ''
" imap <expr> <m-n>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : ''
" smap <expr> <m-n>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : ''

" " Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" " See https://github.com/hrsh7th/vim-vsnip/pull/50
" nmap        s   <Plug>(vsnip-select-text)
" xmap        s   <Plug>(vsnip-select-text)
" nmap        S   <Plug>(vsnip-cut-text)
" xmap        S   <Plug>(vsnip-cut-text)

