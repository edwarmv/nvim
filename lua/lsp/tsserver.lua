local maps = require("config.maps")
local navic_attach = require("plugins.nvim-navic.attach")
--
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- vim.env.TS_TSLINT_ENABLE_WORKSPACE_LIBRARY_EXECUTION=1
-- local util = require("lspconfig.util")

require("typescript").setup({
  disable_commands = false, -- prevent the plugin from creating Vim commands
  disable_formatting = false, -- disable tsserver's formatting capabilities
  debug = false, -- enable debug logging for commands
  server = { -- pass options to lspconfig's setup method
    flags = {
      debounce_text_changes = 0,
    },
    capabilities = capabilities,
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },
    init_options = {
      hostInfo = "neovim",
      preferences = {
        quotePreference = "auto", -- auto double single
        jsxAttributeCompletionStyle = "none",
      },
    },
    settings = {
      completions = { completeFunctionCalls = false },
    },
    on_attach = function(client, bufnr)
      maps.lsp(bufnr)
      navic_attach.attach(client, bufnr)
    end,
  },
})

--{{{
-- require("lspconfig").tsserver.setup({
--   capabilities = capabilities,
--   -- filetypes = {
--   --   "javascript",
--   --   "javascriptreact",
--   --   "javascript.jsx",
--   --   "typescript",
--   --   "typescriptreact",
--   --   "typescript.tsx",
--   -- },
--   init_options = {
--     hostInfo = "neovim",
--     preferences = {
--       quotePreference = "auto", -- auto double single
--       jsxAttributeCompletionStyle = "none",
--     },
--   },
--   settings = {
--     completions = { completeFunctionCalls = false },
--   },
--   on_attach = function(client, bufnr)
--       require("aerial").on_attach(client, bufnr)
--       vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>a", "<cmd>AerialToggle<CR>", {})
--       maps.lsp(bufnr)
--
--       lsp_spinner.on_attach(client, bufnr)
--       require("lsp_signature").on_attach(lsp_signature.config, bufnr)
--   end,
-- })
--}}}

-- vim: foldmethod=marker
