-- nmap <silent><space>fld         <cmd>FzfLua lsp_document_diagnostics<CR>
-- nmap <silent><space>flD         <cmd>FzfLua lsp_workspace_diagnostics<CR>
-- nmap <silent><space>fls         <cmd>FzfLua lsp_document_symbols<CR>

vim.g.coc_fzf_preview = "right:50%"
vim.g.coc_fzf_opts = { "--layout=reverse" }

vim.keymap.set("n", "<space>fld", "<cmd>CocFzfList diagnostics --current-buf<CR>", { silent = true })
vim.keymap.set("n", "<space>flD", "<cmd>CocFzfList diagnostics<CR>", { silent = true })
vim.keymap.set("n", "<space>fls", "<cmd>CocFzfList outline<CR>", { silent = true })
