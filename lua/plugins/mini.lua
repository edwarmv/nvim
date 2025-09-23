return {
  {
    "echasnovski/mini.icons",
    opts = {},
    lazy = true,
    specs = {
      { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
    },
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },
  {
    "echasnovski/mini.diff",
    event = "VeryLazy",
    opts = {
      view = { style = "number" },
      mappings = {
        apply = "",
        reset = "",
        textobject = "",
        goto_first = "",
        goto_prev = "",
        goto_next = "",
        goto_last = "",
      },
    },
    keys = {
      {
        "<leader>go",
        function()
          MiniDiff.toggle_overlay()
        end,
        desc = "[MiniDiff] - Toggle Overlay",
      },
    },
  },
  {
    "echasnovski/mini.indentscope",
    init = function()
      vim.api.nvim_create_autocmd({ "BufAdd", "BufEnter" }, {
        desc = "Disable 'mini.indentscope' when buftype is ''",
        callback = function(args)
          local bufnr = args.buf or vim.fn.expand("<abuf>")
          if vim.bo[bufnr].buftype ~= "" then
            vim.b.miniindentscope_disable = true
          end
        end,
      })
    end,
    opts = { symbol = "▏" },
  },
}
