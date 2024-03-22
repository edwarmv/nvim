return {
  "NTBBloodbath/rest.nvim",
  dependencies = { "luarocks.nvim" },
  enabled = false,
  config = function()
    require("rest-nvim").setup({})

    -- vim.api.nvim_set_keymap('n', '<leader><leader>rr', '<Plug>RestNvim', { noremap = false, silent = true })
    -- vim.api.nvim_set_keymap('n', '<leader><leader>rp', '<Plug>RestNvimPreview', { noremap = false, silent = true })
    -- vim.api.nvim_set_keymap('n', '<leader><leader>rl', '<Plug>RestNvimLast', { noremap = false, silent = true })
  end,
  keys = {
    { "<leader>rr", "<Plug>RestNvim", desc = "REST - run the request under the cursor" },
    { "<leader>rp", "<Plug>RestNvimPreview", desc = "REST - preview the request cURL command" },
    { "<leader>rl", "<Plug>RestNvimLast", desc = "REST - re-run the last request" },
  },
  ft = "http",
}
