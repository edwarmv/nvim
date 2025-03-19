return {
  "nvimtools/hydra.nvim",
  config = function()
    local Hydra = require("hydra")
    local timeout = 1000

    Hydra({
      config = {
        hint = {
          type = "window",
          offset = -1,
        },
        -- on_enter = function()
        --   vim.cmd("IBLDisable")
        -- end,
        -- on_exit = function()
        --   vim.cmd("IBLEnable")
        -- end,
        timeout = timeout,
      },
      name = "Side scroll",
      mode = "n",
      body = "z",
      heads = {
        { "h", "zh" },
        { "l", "zl", { desc = "←/→" } },
        { "H", "zH" },
        { "L", "zL", { desc = "half screen ←/→" } },
      },
    })

    Hydra({
      config = {
        hint = {
          type = "window",
          offset = -1,
        },
        timeout = false,
      },
      mode = "n",
      body = "<c-w>",
      heads = {
        { ">", "<c-w>>" },
        { "<", "<c-w><" },
        { "+", "<c-w>+" },
        { "-", "<c-w>-" },
      },
    })
  end,
}
