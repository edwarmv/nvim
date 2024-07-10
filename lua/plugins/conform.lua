return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo", "Format", "FormatDisable", "FormatEnable" },
  init = function()
    vim.g.disable_autoformat = false
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      json = { { "prettierd", "prettier" } },
      jsonc = { { "prettierd", "prettier" } },
      html = { { "prettierd", "prettier" } },
      htmlangular = { { "prettierd", "prettier" } },
      css = { { "prettierd", "prettier" } },
      scss = { { "prettierd", "prettier" } },
      javascript = { { "prettierd", "prettier" } },
      typescript = { { "prettierd", "prettier" } },
      javascriptreact = { { "prettierd", "prettier" } },
      typescriptreact = { { "prettierd", "prettier" } },
      python = { "ruff_organize_imports", "ruff_format" },
      sql = { "sql_formatter" },
      rust = { "rustfmt" },
    },
    format_on_save = function(bufnr)
      -- Disable with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      if vim.g.disable_autoformat == false or vim.b[bufnr].disable_autoformat == false then
        return { lsp_fallback = true, bufnr = bufnr }
      end
    end,
    -- format_after_save = function(bufnr)
    --   -- Disable with a global or buffer-local variable
    --   if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
    --     return
    --   end
    --   if vim.g.disable_autoformat == false or vim.b[bufnr].disable_autoformat == false then
    --     return { lsp_fallback = true, async = true, bufnr = bufnr }
    --   end
    -- end,
  },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "[LSP] Format",
    },
  },
  config = function(_, opts)
    require("conform").setup(opts)

    vim.api.nvim_create_user_command("Format", function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      require("conform").format({ async = true, lsp_fallback = true, range = range })
    end, { range = true })

    vim.api.nvim_create_user_command("FormatDisable", function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
    end, {
      desc = "Disable autoformat-on-save",
      bang = true,
    })

    vim.api.nvim_create_user_command("FormatEnable", function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = false
      else
        vim.g.disable_autoformat = false
      end
    end, {
      desc = "Re-enable autoformat-on-save",
      bang = true,
    })
  end,
}
