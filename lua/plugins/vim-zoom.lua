return {
  "dhruvasagar/vim-zoom",
  -- dependencies = { "nvim-zh/colorful-winsep.nvim" },
  enabled = true,
  init = function()
    vim.g["zoom#statustext"] = " "
    vim.g.zoom_tmux_z = false
  end,
  keys = {
    { "<leader>z", "<Plug>(zoom-toggle)", desc = "Toggle Zoom" },
  },
  -- config = function()
  -- local utils = require("utils.init")
  -- local colorful_winsep = require("colorful-winsep")
  -- utils.sourceVim("vim-zoom.vim")
  -- vim.api.nvim_create_autocmd("User", {
  --   pattern = "ZoomPre",
  --   callback = function()
  --     colorful_winsep.NvimSeparatorDel()
  --   end,
  -- })
  -- vim.api.nvim_create_autocmd("User", {
  --   pattern = "ZoomPost",
  --   callback = function()
  --     colorful_winsep.NvimSeparatorDel()
  --     colorful_winsep.NvimSeparatorShow()
  --   end,
  -- })
  -- end,
}
