return {
  "s1n7ax/nvim-window-picker",
  name = "window-picker",
  event = "VeryLazy",
  opts = {
    hint = "floating-letter",
    show_prompt = false,
  },
  keys = {
    {
      "-",
      function()
        local _, picked_window_id = pcall(require("window-picker").pick_window)
        local cur_winid = vim.fn.win_getid()
        if picked_window_id and picked_window_id ~= cur_winid then
          vim.api.nvim_set_current_win(picked_window_id)
        end
      end,
      desc = "Pick a window",
    },
  },
}
