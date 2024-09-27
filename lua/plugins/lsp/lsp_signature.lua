local defaults = require("config.defaults")

return {
  "ray-x/lsp_signature.nvim",
  enabled = false,
  event = "VeryLazy",
  opts = {
    -- max_height = math.floor(vim.o.lines * 0.3), -- max height of signature floating_window
    -- max_width = math.floor(vim.o.columns * 0.4), -- max_width of signature floating_window
    floating_window = false, -- show hint in a floating window, set to false for virtual text only mode
    hint_enable = true, -- virtual hint enable
    hint_prefix = {
      above = "↙ ", -- when the hint is on the line above the current line
      current = "← ", -- when the hint is on the same line
      below = "↖ ", -- when the hint is on the line below the current line
    },
    handler_opts = {
      border = defaults.border, -- double, rounded, single, shadow, none
    },
    toggle_key = "<m-s>", -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
    toggle_key_flip_floatwin_setting = true,
    select_signature_key = "<m-n>", -- cycle to next signature, e.g. '<M-n>' function overloading
    move_cursor_key = "<m-p>",
  },
  config = function(_, opts)
    -- require("lsp_signature").setup(opts)
    local enabled_severs = { "ts_ls", "angularls", "basedpyright" }
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if vim.tbl_contains(enabled_severs, client.name) then -- blacklist lsp
          require("lsp_signature").on_attach(opts, bufnr)
        end
      end,
    })
  end,
}