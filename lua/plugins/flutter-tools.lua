return {
  "akinsho/flutter-tools.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local maps = require("config.maps")
    local navic_attach = require("plugins.nvim-navic.attach")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    require("flutter-tools").setup({
      fvm = true,
      lsp = {
        on_attach = function(client, bufnr)
          maps.lsp(bufnr)
          navic_attach.attach(client, bufnr)

          vim.keymap.set("n", "<leader><leader>fc", function()
            require("telescope").extensions.flutter.commands()
          end, { buffer = bufnr, desc = "Flutter Commands" })

          vim.keymap.set("n", "<leader><leader>fv", function()
            require("telescope").extensions.flutter.fvm()
          end, { buffer = bufnr, desc = "Flutter FVM" })
        end,
        capabilities = capabilities,
      },
    })
    require("telescope").load_extension("flutter")
  end,
}
