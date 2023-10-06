local defaults = require("config.defaults")

return {
  "stevearc/aerial.nvim",
  opts = {
    -- Priority list of preferred backends for aerial.
    -- This can be a filetype map (see :help aerial-filetype-map)
    backends = { "lsp", "treesitter", "markdown" },
    layout = {
      -- Determines the default direction to open the aerial window. The 'prefer'
      -- options will open the window in the other direction *if* there is a
      -- different buffer in the way of the preferred direction
      -- Enum: prefer_right, prefer_left, right, left, float
      default_direction = "right",
      -- Determines where the aerial window will be opened
      --   edge   - open aerial at the far right/left of the editor
      --   group  - open aerial to the right/left of the group of windows containing the current buffer
      --   window - open aerial to the right/left of the current window
      placement = "edge",
    },
    -- Show box drawing characters for the tree hierarchy
    show_guides = true,
    -- Call this function when aerial attaches to a buffer.
    -- Useful for setting keymaps. Takes a single `bufnr` argument.
    on_attach = function(bufnr)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>a", "<cmd>AerialToggle<CR><cmd>wincmd =<cr>", {})
    end,
    -- Options for opening aerial in a floating win
    float = {
      -- Controls border appearance. Passed to nvim_open_win
      border = defaults.border,
      -- Determines location of floating window
      --   cursor - Opens float on top of the cursor
      --   editor - Opens float centered in the editor
      --   win    - Opens float centered in the window
      relative = "cursor",
      -- These control the height of the floating window.
      -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
      -- min_height and max_height can be a list of mixed types.
      -- min_height = {8, 0.1} means "the greater of 8 rows or 10% of total"
      max_height = 0.9,
      height = nil,
      min_height = { 8, 0.1 },
      override = function(conf)
        -- This is the config that will be passed to nvim_open_win.
        -- Change values here to customize the layout
        return conf
      end,
    },
  },
}
