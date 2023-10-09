return {
  "gbprod/yanky.nvim",
  dependencies = {
    "kkharji/sqlite.lua",
    {
      "gbprod/cutlass.nvim",
      opts = {
        cut_key = "x",
        override_del = nil,
        exclude = { "ns", "nS", "xs", "xS" },
      },
    },
    -- "anuvyklack/hydra.nvim",
  },
  config = function()
    require("telescope").load_extension("yank_history")
    local mapping = require("yanky.telescope.mapping")
    local utils = require("yanky.utils")
    require("yanky").setup({
      picker = {
        telescope = {
          use_default_mappings = false,
          mappings = {
            default = mapping.put("p"),
            i = {
              -- ["<c-p>"] = mapping.put("p"),
              -- ["<c-k>"] = mapping.put("P"),
              -- ["<c-x>"] = mapping.delete(),
              ["<c-r>"] = mapping.set_register(utils.get_default_register()),
            },
            n = {
              p = mapping.put("p"),
              P = mapping.put("P"),
              d = mapping.delete(),
              r = mapping.set_register(utils.get_default_register()),
            },
          },
        },
      },
      highlight = {
        timer = 250,
      },
    })

    -- vim.keymap.set("n", "<space>y", "<cmd>YankyRingHistory<cr>", {})
    vim.keymap.set("n", "<space>ty", "<cmd>Telescope yank_history<cr>")

    vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)", {})
    vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)", {})
    vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)", {})
    vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)", {})

    vim.keymap.set("n", "]y", "<Plug>(YankyCycleForward)", {})
    vim.keymap.set("n", "[y", "<Plug>(YankyCycleBackward)", {})

    -- local Hydra = require("hydra")
    --
    -- local function t(str)
    --   return vim.api.nvim_replace_termcodes(str, true, true, true)
    -- end
    --
    -- local yanky_hydra = Hydra({
    --   config = {
    --     hint = {
    --       type = "statusline",
    --     },
    --   },
    --   name = "Yank ring",
    --   mode = "n",
    --   heads = {
    --     { "p", "<Plug>(YankyPutAfter)", { desc = "After" } },
    --     { "P", "<Plug>(YankyPutBefore)", { desc = "Before" } },
    --     { "<C-n>", "<Plug>(YankyCycleForward)", { private = true, desc = "↓" } },
    --     { "<C-p>", "<Plug>(YankyCycleBackward)", { private = true, desc = "↑" } },
    --   },
    -- })
    --
    -- -- choose/change the mappings if you want
    -- for key, putAction in pairs({
    --   ["p"] = "<Plug>(YankyPutAfter)",
    --   ["P"] = "<Plug>(YankyPutBefore)",
    --   ["gp"] = "<Plug>(YankyGPutAfter)",
    --   ["gP"] = "<Plug>(YankyGPutBefore)",
    -- }) do
    --   vim.keymap.set({ "n", "x" }, key, function()
    --     vim.fn.feedkeys(t(putAction))
    --     yanky_hydra:activate()
    --   end)
    -- end
    --
    -- -- choose/change the mappings if you want
    -- for key, putAction in pairs({
    --   ["]p"] = "<Plug>(YankyPutIndentAfterLinewise)",
    --   ["[p"] = "<Plug>(YankyPutIndentBeforeLinewise)",
    --   ["]P"] = "<Plug>(YankyPutIndentAfterLinewise)",
    --   ["[P"] = "<Plug>(YankyPutIndentBeforeLinewise)",
    --
    --   [">p"] = "<Plug>(YankyPutIndentAfterShiftRight)",
    --   ["<p"] = "<Plug>(YankyPutIndentAfterShiftLeft)",
    --   [">P"] = "<Plug>(YankyPutIndentBeforeShiftRight)",
    --   ["<P"] = "<Plug>(YankyPutIndentBeforeShiftLeft)",
    --
    --   ["=p"] = "<Plug>(YankyPutAfterFilter)",
    --   ["=P"] = "<Plug>(YankyPutBeforeFilter)",
    -- }) do
    --   vim.keymap.set("n", key, function()
    --     vim.fn.feedkeys(t(putAction))
    --     yanky_hydra:activate()
    --   end)
    -- end
  end,
}
