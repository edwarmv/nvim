return {
  "kevinhwang91/nvim-hlslens",
  config = function()
    local hlslens = require("hlslens")
    hlslens.setup({
      calm_down = true,
      nearest_only = false,
      nearest_float_when = "never",
    })
    local kopts = { noremap = true, silent = true }

    vim.api.nvim_set_keymap(
      "n",
      "n",
      [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
      kopts
    )
    vim.api.nvim_set_keymap(
      "n",
      "N",
      [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
      kopts
    )
    vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
    vim.api.nvim_set_keymap("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
    vim.api.nvim_set_keymap("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
    vim.api.nvim_set_keymap("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

    vim.api.nvim_set_keymap("n", "<Leader>l", "<Cmd>noh<CR>", kopts)
    -- local function nN(char)
    --   local ok, winid = hlslens.nNPeekWithUFO(char)
    --   if ok and winid then
    --     -- Safe to override buffer scope keymaps remapped by ufo,
    --     -- ufo will restore previous buffer keymaps before closing preview window
    --     -- Type <CR> will switch to preview window and fire `trace` action
    --     vim.keymap.set("n", "<CR>", function()
    --       local keyCodes = vim.api.nvim_replace_termcodes("<Tab><CR>", true, false, true)
    --       vim.api.nvim_feedkeys(keyCodes, "im", false)
    --     end, { buffer = true })
    --   end
    -- end
    --
    -- vim.keymap.set({ "n", "x" }, "n", function()
    --   nN("n")
    -- end)
    -- vim.keymap.set({ "n", "x" }, "N", function()
    --   nN("N")
    -- end)
  end,
}
