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

  vim.keymap.set("n", "<c-w>d", function()
    vim.diagnostic.open_float({ border = defaults.border })
  end, { desc = "[LSP] Show line diagnostics", buffer = buffer })

  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[LSP] Declaration", buffer = buffer })
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[LSP] Definition", buffer = buffer })
  vim.keymap.set("n", "gs", function()
    require("aerial").snacks_picker()
  end, { desc = "[LSP] Document Symbols", buffer = buffer })
  vim.keymap.set("n", "gS", function()
    Snacks.picker.lsp_workspace_symbols()
  end, { desc = "[LSP] Workspace Symbols", buffer = buffer })

  vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover({ border = defaults.border })
  end, { desc = "[LSP] Hover", buffer = buffer })

  -- vim.keymap.set("n", "gli", vim.lsp.buf.implementation, { desc = "[LSP] Implementation", buffer = buffer })

  vim.keymap.set({ "n", "i", "s" }, "<c-s>", function()
    vim.lsp.buf.signature_help({ border = defaults.border })
  end, { desc = "[LSP] Signature Help", buffer = buffer })

  -- vim.keymap.set("n", "glT", vim.lsp.buf.type_definition, { desc = "[LSP] Type Definition", buffer = buffer })

  vim.keymap.set("n", "gra", function()
    require("tiny-code-action").code_action()
  end, { desc = "[LSP] Code Action", buffer = buffer })

  vim.keymap.set("n", "grn", function()
    require("config.utils.rename").lsp_buf_rename_use_priority_or_any()
  end, { desc = "[LSP] Rename", buffer = buffer })

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

  -- Toggle LSP inlay hints for the current buffer.
  vim.keymap.set("n", "gh", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  end, { desc = "[LSP] Toggle Inlay Hints", buffer = buffer })

  local goto_preview = require("goto-preview")

  vim.keymap.set(
    "n",
    "glpd",
    goto_preview.goto_preview_definition,
    { desc = "[LSP] Goto Preview Definition", buffer = buffer }
  )
  vim.keymap.set(
    "n",
    "glpt",
    goto_preview.goto_preview_type_definition,
    { desc = "[LSP] Goto Preview Type Definition", buffer = buffer }
  )
  vim.keymap.set(
    "n",
    "glpi",
    goto_preview.goto_preview_implementation,
    { desc = "[LSP] Goto Preview Implementation", buffer = buffer }
  )
  vim.keymap.set("n", "glP", goto_preview.close_all_win, { desc = "[LSP] Goto Preview Close All Win", buffer = buffer })
  -- Only set if you have telescope installed
  vim.keymap.set(
    "n",
    "glpr",
    goto_preview.goto_preview_references,
    { desc = "[LSP] Goto Preview References", buffer = buffer }
  )
  vim.keymap.set(
    "n",
    "glpq",
    goto_preview.close_all_win,
    { desc = "[LSP] Goto Preview Close All Win", buffer = buffer }
  )
end

local group = vim.api.nvim_create_augroup("LspMappings", { clear = false })

vim.api.nvim_create_autocmd("LspAttach", {
  group = group,
  callback = function(event)
    M.lsp(event.buf)
    vim.lsp.document_color.enable(false, event.buf, { style = " " })
  end,
})

return M
