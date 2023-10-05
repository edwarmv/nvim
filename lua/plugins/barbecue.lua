return {
  "utilyre/barbecue.nvim",
  enabled = false,
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  opts = {
    -- configurations go here
    create_autocmd = true,
    show_modified = true,
    show_navic = false,
  },
  config = function(_, opts)
    require("barbecue").setup(opts)

    -- vim.api.nvim_create_autocmd({
    --   "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
    --   "BufWinEnter",
    --   "CursorHold",
    --   "InsertLeave",
    --
    --   -- include this if you have set `show_modified` to `true`
    --   "BufModifiedSet",
    -- }, {
    --   group = vim.api.nvim_create_augroup("barbecue.updater", {}),
    --   callback = function()
    --     require("barbecue.ui").update()
    --   end,
    -- })
  end,
}
