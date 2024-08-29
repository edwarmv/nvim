return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    delay = function(ctx)
      return ctx.plugin and 0 or 500
    end,
    -- filter = function(mapping)
    --   return mapping.desc and mapping.desc ~= ""
    -- end,
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
