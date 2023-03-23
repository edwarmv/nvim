vim.g.yoinkIncludeDeleteOperations = 1

vim.api.nvim_set_keymap("n", "[y", "<plug>(YoinkRotateBack)", { noremap = false, silent = true, expr = false })
vim.api.nvim_set_keymap("n", "]y", "<plug>(YoinkRotateForward)", { noremap = false, silent = true, expr = false })
vim.api.nvim_set_keymap("n", "p", "<plug>(YoinkPaste_p)", { noremap = false, silent = true, expr = false })
vim.api.nvim_set_keymap("n", "P", "<plug>(YoinkPaste_P)", { noremap = false, silent = true, expr = false })
vim.api.nvim_set_keymap("n", "<leader>y", "<cmd>Yanks<cr>", { noremap = false, silent = true, expr = false })
