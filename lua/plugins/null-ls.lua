return {
  "jose-elias-alvarez/null-ls.nvim",
  enabled = false,
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local defaults = require("config.defaults")
    local null_ls = require("null-ls")
    local maps = require("config.maps")

    null_ls.setup({
      border = defaults.border,
      sources = {
        -- null_ls.builtins.diagnostics.eslint,
        -- null_ls.builtins.code_actions.eslint,
        null_ls.builtins.formatting.sql_formatter,
        null_ls.builtins.formatting.prettier,
        -- null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.formatting.autopep8,
        null_ls.builtins.formatting.black,
        null_ls.builtins.code_actions.eslint_d,
      },
      -- on_attach = function(client, bufnr)
      --   local opts = {
      --     buffer = bufnr,
      --   }
      --   vim.keymap.set("n", "<leader>nf", "<cmd>lua vim.lsp.buf.format()<cr>", opts)
      --
      --   -- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/720#issuecomment-1133609413
      --   vim.keymap.set("v", "<leader>nf", "<esc><cmd>lua vim.lsp.buf.range_formatting()<cr>", opts)
      -- end,
    })

    vim.api.nvim_create_user_command("NullLsStart", function()
      -- you can also create commands to disable or enable sources
      require("null-ls").enable({})
    end, {})

    vim.api.nvim_create_user_command("NullLsStop", function()
      -- you can also create commands to disable or enable sources
      require("null-ls").disable({})
    end, {})
  end,
}
