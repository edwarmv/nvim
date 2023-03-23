-- local jump_target = require("hop.jump_target")
-- jump_target.regex_by_line_start_skip_whitespace = function()
--   local pat = vim.regex('^\\(\\w\\|\\s*\\zs\\|$\\|""\\)')
--   return {
--     oneshot = true,
--     match = function(s)
--       local b, e = pat:match_str(s)
--       if b == 0 and e == 0 then
--         return 0, 1
--       else
--         return b, e
--       end
--     end,
--   }
-- end

require("hop").setup({
  create_hl_autocmd = false,
})
-- require'hop'.hint_words()
vim.keymap.set("n", "<leader>hh", "<cmd>HopChar1<CR>", { silent = true })
vim.keymap.set("n", "<leader>hH", "<cmd>HopChar2<CR>", { silent = true })
vim.keymap.set("n", "<leader>hl", "<cmd>HopLineStart<CR>", { silent = true })
-- vim.keymap.set('n', '<leader>hp', '<cmd>HopPattern<CR>', { silent = true })
-- vim.keymap.set('n', '<leader>hw', '<cmd>HopWord<CR>', { silent = true })

vim.keymap.set("v", "<leader>hh", "<cmd>HopChar1<CR>", { silent = true })
vim.keymap.set("v", "<leader>hH", "<cmd>HopChar2<CR>", { silent = true })
vim.keymap.set("v", "<leader>hl", function()
  if vim.fn.mode() == "V" then
    vim.api.nvim_command("HopLineStart")
  else
    vim.api.nvim_command("HopVertical")
  end
end, { silent = true, desc = "HopLine" })
-- vim.keymap.set('v', '<leader>hp', '<cmd>HopPattern<CR>', { silent = true })
-- vim.keymap.set('v', '<leader>hw', '<cmd>HopWord<CR>', { silent = true })

-- vim.cmd([[hi HopNextKey  cterm=bold gui=bold guifg=#282828 guibg=#a9b665]])
-- vim.cmd([[hi HopNextKey1 cterm=bold gui=bold guifg=#282828 guibg=#a9b665]])
-- vim.cmd([[hi HopNextKey2 cterm=bold gui=bold guifg=#282828 guibg=#a9b665]])
-- -- vim.cmd [[hi HopUnmatched cterm=italic gui=italic guifg=#282828 guibg=#928374]]
-- vim.cmd([[hi HopUnmatched cterm=italic gui=italic guifg=#928374]])
