local winpick = require("winpick")

winpick.setup({
  border = "single",
  filter = nil, -- doesn't ignore any window by default
  prompt = "Pick a window: ",
  format_label = winpick.defaults.format_label, -- formatted as "<label>: <buffer name>"
  chars = nil,
})

vim.keymap.set("n", "-", function()
  local _, picked_window_id = pcall(winpick.select)
  local cur_winid = vim.fn.win_getid()
  if picked_window_id and picked_window_id ~= cur_winid then
    vim.api.nvim_set_current_win(picked_window_id)
  end
end, { desc = "Pick a window" })

