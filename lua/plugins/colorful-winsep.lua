return {
  "nvim-zh/colorful-winsep.nvim",
  enabled = false,
  opts = {
    highlight = {
      fg = "#d3869b",
      bg = "#3c3836",
    },
    interval = 3000,
    create_event = function()
      local zoomstatus = vim.fn["zoom#statusline"]()
      print("colorful created " .. zoomstatus)
      if zoomstatus == "[Z]" then
        require("colorful-winsep").NvimSeparatorDel()
      end
    end,
    close_event = function()
      -- local zoomstatus = vim.fn["zoom#statusline"]()
      --      print("colorful closed: "..zoomstatus)
    end,
  },
  event = { "WinNew" },
}
