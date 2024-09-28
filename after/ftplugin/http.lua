vim.keymap.set("n", "<localleader>rr", "<cmd>Rest run<cr>", { desc = "Run request under the cursor", buffer = true })
vim.keymap.set("n", "<localleader>rl", "<cmd>Rest run last<cr>", { desc = "Re-run latest request", buffer = true })
