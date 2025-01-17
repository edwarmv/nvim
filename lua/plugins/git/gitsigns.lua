local defaults = require("config.defaults")

return {
  "lewis6991/gitsigns.nvim",
  dependencies = {
    {
      "f-person/git-blame.nvim",
      init = function()
        vim.g.gitblame_enabled = 0
        vim.g.gitblame_set_extmark_options = {
          hl_mode = "combine",
        }
        vim.g.gitblame_set_extmark_options = { priority = 7 }
      end,
    },
    -- { "ruifm/gitlinker.nvim" },
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
      map("n", "<leader>gu", gitsigns.undo_stage_hunk, { desc = "[Gitsigns] Undo Stage Hunk" })
      map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "[Gitsigns] Reset Buffer" })
      map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "[Gitsigns] Preview Hunk" })
      map("n", "<leader>gP", gitsigns.preview_hunk_inline, { desc = "[Gitsigns] Preview Hunk Inline" })
      map("n", "<leader>gq", gitsigns.setloclist, { desc = "[Gitsigns] Quifix" })
      map("n", "<leader>gd", gitsigns.diffthis, { desc = "[Gitsigns] Diff This" })
      map("n", "<leader>gD", function()
        gitsigns.diffthis("~")
      end, { desc = "[Gitsigns] Diff This" })

      -- git blame
      map("n", "<leader>gb", "<cmd>GitBlameToggle<cr>", { desc = "[GitBlame] - Toggle" })
      map("n", "<leader>gBch", "<cmd>GitBlameCopySHA<cr>", { desc = "[GitBlame] - Copy Hash" })
      map("n", "<leader>gBcf", "<cmd>GitBlameCopyFileURL<cr>", { desc = "[GitBlame] - Copy File URL" })
      map("n", "<leader>gBcc", "<cmd>GitBlameCopyCommitURL<cr>", { desc = "[GitBlame] - Copy Commit URL" })

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
