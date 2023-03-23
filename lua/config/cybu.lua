local cybu = require("cybu")

cybu.setup({
  position = {
    relative_to = "editor", -- win, editor, cursor
    anchor = "bottomleft", -- topleft, topcenter, topright,
    -- centerleft, center, centerright,
    -- bottomleft, bottomcenter, bottomright
    vertical_offset = 1, -- vertical offset from anchor in lines
    horizontal_offset = 0, -- vertical offset from anchor in columns
    max_win_height = 5, -- height of cybu window in lines
    max_win_width = 0.5, -- integer for absolute in columns
    -- float for relative to win/editor width
  },
  style = {
    path = "tail", -- absolute, relative, tail (filename only)
    border = "single", -- single, double, rounded, none
    separator = " ", -- string used as separator
    prefix = "…", -- string used as prefix for truncated paths
    padding = 1, -- left & right padding in number of spaces
    hide_buffer_id = true, -- hide buffer IDs in window
    devicons = {
      enabled = true, -- enable or disable web dev icons
      colored = true, -- enable color for web dev icons
    },
    highlights = { -- see highlights via :highlight
      current_buffer = "CybuFocus", -- current / selected buffer
      adjacent_buffers = "CybuAdjacent", -- buffers not in focus
      background = "NormalFloat", -- window background
      border = "FloatBorder", -- border of the window
    },
  },
  behavior = { -- set behavior for different modes
    mode = {
      default = {
        switch = "immediate", -- immediate, on_close
        view = "rolling", -- paging, rolling
      },
      last_used = {
        switch = "on_close", -- immediate, on_close
        view = "paging", -- paging, rolling
      },
    },
  },
  display_time = 750, -- time the cybu window is displayed
  exclude = { -- filetypes, cybu will not be active
    "neo-tree",
    "fugitive",
    "qf",
    "packer",
    -- "",
    "NvimTree",
  },
  fallback = function() end, -- arbitrary fallback function
  -- used in excluded filetypes
})
vim.keymap.set("n", "K", "<Plug>(CybuPrev)")
vim.keymap.set("n", "J", "<Plug>(CybuNext)")
vim.keymap.set({ "n", "v" }, "<c-s-tab>", "<plug>(CybuLastusedPrev)")
vim.keymap.set({ "n", "v" }, "<c-tab>", "<plug>(CybuLastusedNext)")

-- local opened_cybu = false
--
-- vim.api.nvim_create_autocmd("User", {
--   pattern = "CybuOpen",
--   callback = function()
--     opened_cybu = true
--     -- local bufnr = cybu.load_target_buf()
--     -- local bufnr = cybu.get_cybu_buf()
--     -- local wins = vim.fn.win_findbuf(bufnr)
--     -- vim.fn.win_gotoid(wins[1])
--   end,
-- })
--
-- vim.api.nvim_create_autocmd("User", {
--   pattern = "CybuClose",
--   callback = function()
--     opened_cybu = false
--   end,
-- })
--
-- vim.keymap.set("n", "<cr>", function()
--   if opened_cybu then
--     cybu.load_target_buf()
--     -- cybu.close_cybu_win()
--   end
-- end)
--
-- vim.api.nvim_create_autocmd("BufLeave", {
--   callback = function()
--     if opened_cybu then
--       cybu.close_cybu_win()
--     end
--   end,
-- })
--
-- -- vim.keymap.set("n", "<s-tab>", "<Plug>(CybuPrev)")
-- -- vim.keymap.set("n", "<tab>", "<Plug>(CybuNext)")
-- vim.keymap.set("n", "<s-tab>", "<plug>(CybuLastusedPrev)")
-- vim.keymap.set("n", "<tab>", "<plug>(CybuLastusedNext)")
