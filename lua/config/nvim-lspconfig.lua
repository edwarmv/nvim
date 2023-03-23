local util = require("lspconfig.util")

util.get_managed_clients = function()
  local configs = require("lspconfig.configs")
  local clients = {}
  for _, config in pairs(configs) do
    if config.manager then
      vim.list_extend(clients, config.manager.clients())
    end
  end
  return clients
end

require("lspconfig")

local function filter_client(list, val)
  for _, value in ipairs(list) do
    if value == val then
      return false
    end
  end
  return true
end

-- vim.lsp.buf.format({
--   filter = function(client)
--     return filter_client({
--       "tsserver",
--       "angularls",
--       "html",
--       "cssls",
--       "jsonls",
--       "yamls",
--       "tailwindcss",
--     }, client.name)
--   end,
-- })
