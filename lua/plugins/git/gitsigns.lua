local defaults = require("config.defaults")

return {
  "lewis6991/gitsigns.nvim",
  dependencies = {
    {
      "akinsho/git-conflict.nvim",
      opts = {
        default_mappings = false, -- disable buffer local mapping created by this plugin
        disable_diagnostics = true, -- This will disable the diagnostics in a buffer whilst it is conflicted
        highlights = { -- They must have background color, otherwise the default color will be used
          current = "DiffAdd",
          incoming = "DiffChange",
          ancestor = "Visual",
        },
      },
    },
  },
  opts = {
    signs = {
      add = { text = "┃" },
      change = { text = "┃" },
      delete = { text = "┃" },
      topdelete = { text = "┃" },
      changedelete = { text = "┃" },
      untracked = { text = "┃" },
    },
    signs_staged = {
      add = { text = "┃" },
      change = { text = "┃" },
      delete = { text = "┃" },
      topdelete = { text = "┃" },
      changedelete = { text = "┃" },
      untracked = { text = "┃" },
    },
    signcolumn = true,
    preview_config = {
      border = defaults.border,
    },
    current_line_blame_opts = {
      delay = 300,
    },
    on_attach = function(bufnr)
      local gitsigns = require("gitsigns")

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map("n", "]c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          gitsigns.nav_hunk("next")
        end
      end, { desc = "[Gitsigns] Next Hunk" })

      map("n", "[c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          gitsigns.nav_hunk("prev")
        end
      end, { desc = "[Gitsigns] Prev Hunk" })

      -- Actions
      map("n", "<leader>gs", gitsigns.stage_hunk)
      map("n", "<leader>gr", gitsigns.reset_hunk)
      map("v", "<leader>gs", function()
        gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end)
      map("v", "<leader>gr", function()
        gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end)
      map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "[Gitsigns] Stage Buffer" })
      map("n", "<leader>gu", gitsigns.stage_hunk, { desc = "[Gitsigns] Undo Stage Hunk" })
      map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "[Gitsigns] Reset Buffer" })
      map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "[Gitsigns] Preview Hunk" })
      map("n", "<leader>gP", gitsigns.preview_hunk_inline, { desc = "[Gitsigns] Preview Hunk Inline" })
      map("n", "<leader>gq", gitsigns.setloclist, { desc = "[Gitsigns] Quifix" })
      map("n", "<leader>gd", gitsigns.diffthis, { desc = "[Gitsigns] Diff This" })
      map("n", "<leader>gD", function()
        gitsigns.diffthis("~")
      end, { desc = "[Gitsigns] Diff This" })

      map("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", { desc = "[GitSigns] - Toggle Blame" })

      map({ "o", "x" }, "ig", ":<C-U>Gitsigns select_hunk<CR>", { silent = true })

      -- git conflict
      map("n", "<leader>gcq", "<cmd>GitConflictListQf<cr>", { desc = "Git Conflict - Quickfix" })
      map("n", "<leader>gcr", "<cmd>GitConflictRefresh<cr>", { desc = "Git Conflict - Refresh" })
      map("n", "<leader>gco", "<Plug>(git-conflict-ours)", { desc = "Git Conflict - Choose Ours" })
      map("n", "<leader>gct", "<Plug>(git-conflict-theirs)", { desc = "Git Conflict - Choose Theirs" })
      map("n", "<leader>gcb", "<Plug>(git-conflict-both)", { desc = "Git Conflict - Choose Both" })
      map("n", "<leader>gc0", "<Plug>(git-conflict-none)", { desc = "Git Conflict - Choose None" })

      map("n", "[x", "<Plug>(git-conflict-prev-conflict)", { desc = "Git Conflict - Prev" })
      map("n", "]x", "<Plug>(git-conflict-next-conflict)", { desc = "Git Conflict - Next" })
    end,
  },
}

-- vim: foldmethod=marker
