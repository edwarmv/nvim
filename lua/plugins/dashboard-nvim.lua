return {
  "glepnir/dashboard-nvim",
  enabled = false,
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    {
      "folke/drop.nvim",
      enabled = false,
      event = "VimEnter",
      config = function()
        require("drop").setup()
      end,
    },
  },
  event = "VimEnter",
  config = function()
    require("dashboard").setup({
      theme = "hyper",
      disable_move = true,
      config = {
        header = {
          " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
          " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
          " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
          " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
          " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
          " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
        },
      },
    })
  end,
}
