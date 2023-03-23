require("luasnip.loaders.from_vscode").lazy_load()
local types = require("luasnip.util.types")
require("luasnip.config").setup({
  history = true,
  -- ext_opts = {
  --   [types.choiceNode] = {
  --     active = {
  --       virt_text = { { "●", "red" } },
  --       hl_mode = "combine",
  --       priority = 1000,
  --     },
  --   },
  --   [types.insertNode] = {
  --     active = {
  --       virt_text = { { "●", "Green" } },
  --       hl_mode = "combine",
  --       priority = 1000,
  --     },
  --   },
  -- },
  -- ext_opts = {
  --   [types.insertNode] = {
  --     active = {
  --       virt_text = { { " ", "CmpItemKindSnippet" } },
  --       priority = 200,
  --     },
  --   },
  -- },
  -- delete_check_events = "InsertLeave",
  -- region_check_events = "InsertEnter"
})

-- vim.api.nvim_create_autocmd("InsertLeave", {
--   callback = function()
--     if require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
--       and not require("luasnip").session.jump_active then
--       require("luasnip").unlink_current()
--     end
--   end,
-- })

-- see: https://github.com/L3MON4D3/LuaSnip/issues/258#issuecomment-1011938524
-- function leave_snippet()
--   if
--     ((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
--     and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
--     and not require("luasnip").session.jump_active
--   then
--     require("luasnip").unlink_current()
--   end
-- end

vim.api.nvim_create_autocmd("ModeChanged", {
  callback = function()
    if
      ((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
      and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
      and not require("luasnip").session.jump_active
    then
      require("luasnip").unlink_current()
    end
  end,
})

-- stop snippets when you leave to normal mode
-- vim.api.nvim_command([[
--     autocmd ModeChanged * lua leave_snippet()
-- ]])
