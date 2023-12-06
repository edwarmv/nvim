local defaults = require("config.defaults")

return {
  "lewis6991/gitsigns.nvim",
  opts = {
    signs = {
      add = { text = "▐" },
      change = { text = "▐" },
      delete = { text = "▐" },
      topdelete = { text = "▐" },
      changedelete = { text = "▐" },
      untracked = { text = "▐" },
    },
    _extmark_signs = false,
    signcolumn = true,
    preview_config = {
      border = defaults.border,
      style = "minimal",
      relative = "cursor",
      row = 1,
      col = 0,
      width = vim.opt.columns:get() + 2,
      height = math.floor(vim.opt.lines:get() / 4),
    },
    yadm = {
      enable = true,
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map("n", "]c", function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return "<Ignore>"
      end, { expr = true, desc = "[Gitsigns] Next Hunk" })

      map("n", "[c", function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return "<Ignore>"
      end, { expr = true, desc = "[Gitsigns] Prev Hunk" })

      -- Actions
      map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>", { desc = "[Gitsigns] Stage Hunk" })
      map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>", { desc = "[Gitsigns] Reset Hunk" })
      map("n", "<leader>gS", gs.stage_buffer, { desc = "[Gitsigns] Stage Buffer" })
      map("n", "<leader>gu", gs.undo_stage_hunk, { desc = "[Gitsigns] Undo Stage Hunk" })
      map("n", "<leader>gR", gs.reset_buffer, { desc = "[Gitsigns] Reset Buffer" })
      map("n", "<leader>gp", gs.preview_hunk, { desc = "[Gitsigns] Preview Hunk" })
      map("n", "<leader>gP", gs.preview_hunk_inline, { desc = "[Gitsigns] Preview Hunk Inline" })
      map("n", "<leader>gq", "<cmd>Gitsigns setloclist<cr>", { desc = "[Gitsigns] Quifix" })
      -- map("n", "<leader>hb", function()
      --   gs.blame_line({ full = true })
      -- end, { desc = "[Gitsigns] Line Blame" })
      -- map("n", "<leader>hB", gs.toggle_current_line_blame, { desc = "[Gitsigns] Toggle Current Line Blame" })
      -- map("n", "<leader>hd", gs.diffthis, {desc="[Gitsigns] Stage Hunk"})
      -- map("n", "<leader>hD", function()
      --   gs.diffthis("~")
      -- end)
      -- map("n", "<leader>td", gs.toggle_deleted)

      -- Text object
      map({ "o", "x" }, "ig", ":<C-U>Gitsigns select_hunk<CR>", { silent = true })
    end,
  },
}

-- vim: foldmethod=marker
