local M = {}

M.lsp = function(bufnr)
  local opts = {
    buffer = bufnr,
    silent = true,
  }

  -- lspsaga
  -- vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
  -- vim.keymap.set("n", "gld", "<cmd>Lspsaga peek_definition<cr>", opts)
  -- vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts)
  -- vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
  -- vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
  -- vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)

  vim.keymap.set("n", "glD", vim.lsp.buf.declaration, { desc = "[LSP] Declaration" })

  vim.keymap.set("n", "gld", vim.lsp.buf.definition, { desc = "[LSP] Definition" })

  vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "[LSP] Hover" })

  vim.keymap.set("n", "gli", vim.lsp.buf.implementation, { desc = "[LSP] Implementation" })

  vim.keymap.set({ "n", "i" }, "<c-s>", vim.lsp.buf.signature_help, { desc = "[LSP] Signature Help" })

  vim.keymap.set("n", "glt", vim.lsp.buf.type_definition, { desc = "[LSP] Type Definition" })

  vim.keymap.set("n", "glr", vim.lsp.buf.rename, { desc = "[LSP] Rename" })

  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[LSP] Code Action" })

  vim.keymap.set("n", "glR", vim.lsp.buf.references, { desc = "[LSP] References" })

  vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "[LSP] Format" })

  vim.keymap.set("v", "<leader>f", vim.lsp.buf.format, { desc = "[LSP] Format" })

  vim.keymap.set("n", "<leader>d", function()
    vim.diagnostic.open_float({ border = "single" })
  end, { desc = "[Diagnostic] Current Line" })

  vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "[Diagnostic] Location List" })

  vim.keymap.set("n", "]d", function()
    vim.diagnostic.goto_next({ float = false })
  end, { desc = "[Diagnostic] Next" })

  vim.keymap.set("n", "[d", function()
    vim.diagnostic.goto_prev({ float = false })
  end, { desc = "[Diagnostic] Prev" })

  -- vim.keymap.set('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- vim.keymap.set('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- vim.keymap.set('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)

  -- local wk = require("which-key")
  --
  -- wk.register({
  --   g = {
  --     D = "LSP Declaration",
  --     d = "LSP Definition",
  --     t = "LSP Type Definition",
  --     r = "LSP Rename",
  --     i = "LSP Implementation",
  --     R = "LSP References",
  --   },
  --   ["<leader>"] = {
  --     f = "LSP Format",
  --     d = "Diagnostic Open",
  --   },
  --   ["]"] = {
  --     d = "Diagnostic Next",
  --   },
  --   ["["] = {
  --     d = "Diagnostic Prev",
  --   },
  -- })
end
-- 
-- 
return M
