local defaults = require("config.defaults")
local M = {}

M.lsp = function(buffer)
  vim.keymap.set("n", "grr", "<cmd>Glance references<cr>", { desc = "[LSP - Glance] References", buffer = buffer })
  vim.keymap.set("n", "gld", "<cmd>Glance definitions<cr>", { desc = "[LSP - Glance] Definitions", buffer = buffer })
  vim.keymap.set(
    "n",
    "glt",
    "<cmd>Glance type_definitions<cr>",
    { desc = "[LSP - Glance] Type Definitions", buffer = buffer }
  )
  vim.keymap.set(
    "n",
    "gli",
    "<cmd>Glance implementations<cr>",
    { desc = "[LSP - Glance] Implementations", buffer = buffer }
  )

  vim.keymap.set(
    "n",
    "<c-w>d",
    "<cmd>Lspsaga show_line_diagnostics<cr>",
    { desc = "[LSP - Saga] Show line diagnostics", buffer = buffer }
  )

  vim.keymap.set(
    "n",
    "<c-w><c-d>",
    "<cmd>Lspsaga show_cursor_diagnostics<cr>",
    { desc = "[LSP - Saga] Show cursor diagnostics", buffer = buffer }
  )

  vim.keymap.set(
    "n",
    "glfr",
    "<cmd>Lspsaga finder ref<cr>",
    { desc = "[LSP - Saga] Finder References", buffer = buffer }
  )
  vim.keymap.set("n", "glF", "<cmd>Lspsaga finder<cr>", { desc = "[LSP - Saga] Finder", buffer = buffer })
  vim.keymap.set("n", "glI", "<cmd>Lspsaga incoming_calls<cr>", { desc = "[LSP] Incoming Calls", buffer = buffer })
  vim.keymap.set("n", "glO", "<cmd>Lspsaga outgoing_calls<cr>", { desc = "[LSP] Outgoing Calls", buffer = buffer })

  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[LSP] Declaration", buffer = buffer })
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[LSP] Definition", buffer = buffer })

  vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover({ border = defaults.border })
  end, { desc = "[LSP] Hover", buffer = buffer })

  -- vim.keymap.set("n", "gli", vim.lsp.buf.implementation, { desc = "[LSP] Implementation", buffer = buffer })

  vim.keymap.set({ "n", "i", "s" }, "<c-s>", function()
    vim.lsp.buf.signature_help({ border = defaults.border })
  end, { desc = "[LSP] Signature Help" })

  -- vim.keymap.set("n", "glT", vim.lsp.buf.type_definition, { desc = "[LSP] Type Definition", buffer = buffer })

  vim.keymap.set("n", "grn", "<cmd>Lspsaga rename<cr>", { desc = "[LSP] Lspsaga Rename", buffer = buffer })

  vim.keymap.set("n", "gra", "<cmd>Lspsaga code_action<cr>", { desc = "[LSP] Lspsaga Code Action", buffer = buffer })

  vim.keymap.set("n", "glr", vim.lsp.buf.references, { desc = "[LSP] References", buffer = buffer })

  vim.keymap.set("n", "]d", function()
    vim.diagnostic.jump({ count = 1, float = false })
  end, { desc = "[Diagnostic] Next", buffer = buffer })

  vim.keymap.set("n", "]E", function()
    vim.diagnostic.jump({ count = 1, float = false, severity = vim.diagnostic.severity.ERROR })
  end, { desc = "[Diagnostic] Next Error  ", buffer = buffer })

  vim.keymap.set("n", "[d", function()
    vim.diagnostic.jump({ count = -1, float = false })
  end, { desc = "[Diagnostic] Prev", buffer = buffer })

  vim.keymap.set("n", "[E", function()
    vim.diagnostic.jump({ count = -1, float = false, severity = vim.diagnostic.severity.ERROR })
  end, { desc = "[Diagnostic] Prev Error  ", buffer = buffer })

  vim.keymap.set(
    "n",
    "glpd",
    "<cmd>Lspsaga peek_definition<cr>",
    { desc = "[LSP] Lspsaga Peek Definition", buffer = buffer }
  )
  vim.keymap.set(
    "n",
    "glpt",
    "<cmd>Lspsaga peek_type_definition<cr>",
    { desc = "[LSP] Lspsaga Peek Type Definition", buffer = buffer }
  )
end

local group = vim.api.nvim_create_augroup("LspMappings", { clear = false })

vim.api.nvim_create_autocmd("LspAttach", {
  group = group,
  callback = function(event)
    M.lsp(event.buf)
  end,
})

return M
