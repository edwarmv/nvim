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

  local lsp_priority = {
    rename = {
      "angularls",
    },
  }

  local lsp_have_feature = {
    rename = function(client)
      return client.supports_method("textDocument/rename")
    end,
    inlay_hint = function(client)
      return client.supports_method("textDocument/inlayHint")
    end,
  }

  local function get_lsp_client_names(have_feature)
    local client_names = {}
    local attached_clients = vim.lsp.get_clients({ bufnr = 0 })
    for _, client in ipairs(attached_clients) do
      if have_feature(client) then
        table.insert(client_names, client.name)
      end
    end
    return client_names
  end

  local function lsp_buf_rename(client_name)
    vim.lsp.buf.rename(nil, { name = client_name })
  end

  local function lsp_buf_rename_use_one(fallback)
    local client_names = get_lsp_client_names(lsp_have_feature.rename)
    if #client_names == 1 then
      lsp_buf_rename(client_names[1])
      return
    end
    if fallback then
      fallback()
    end
  end

  local function lsp_buf_rename_use_priority(fallback)
    local client_names = get_lsp_client_names(lsp_have_feature.rename)
    for _, client_priority_name in ipairs(lsp_priority.rename) do
      for _, client_name in ipairs(client_names) do
        if client_priority_name == client_name then
          lsp_buf_rename(client_priority_name)
          return
        end
      end
    end
    if fallback then
      fallback()
    end
  end

  local function lsp_buf_rename_use_any(fallback)
    local client_names = get_lsp_client_names(lsp_have_feature.rename)
    for _, client_name in ipairs(client_names) do
      lsp_buf_rename(client_name)
      return
    end
    if fallback then
      fallback()
    end
  end

  local function lsp_buf_rename_use_priority_or_any()
    lsp_buf_rename_use_one(function()
      lsp_buf_rename_use_priority(function()
        lsp_buf_rename_use_any()
      end)
    end)
  end

  -- thanks to https://github.com/fightingdreamer/dotfiles/blob/54bb8b90b1741f58e02e1911cb6de73d48160247/lua/nv/lua/core/opts_lsp.lua#L41
  vim.keymap.set("n", "grn", lsp_buf_rename_use_priority_or_any, { desc = "[LSP] Rename", buffer = buffer })

  vim.keymap.set("n", "gra", vim.lsp.buf.code_action, { desc = "[LSP] Code Action", buffer = buffer })

  vim.keymap.set("n", "glr", vim.lsp.buf.references, { desc = "[LSP] References", buffer = buffer })

  vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "[Diagnostic] Location List", buffer = buffer })

  vim.keymap.set("n", "]d", function()
    vim.diagnostic.jump({ count = 1, float = false })
  end, { desc = "[Diagnostic] Next", buffer = buffer })

  vim.keymap.set("n", "]D", function()
    vim.diagnostic.jump({ count = 1, float = false, severity = vim.diagnostic.severity.ERROR })
  end, { desc = "[Diagnostic] Next Error  ", buffer = buffer })

  vim.keymap.set("n", "[d", function()
    vim.diagnostic.jump({ count = -1, float = false })
  end, { desc = "[Diagnostic] Prev", buffer = buffer })

  vim.keymap.set("n", "[D", function()
    vim.diagnostic.jump({ count = -1, float = false, severity = vim.diagnostic.severity.ERROR })
  end, { desc = "[Diagnostic] Prev Error  ", buffer = buffer })

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
  end,
})

return M
