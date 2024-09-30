local defaults = require("config.defaults")

vim.g.gitblame_enabled = 0
vim.g.gitblame_set_extmark_options = {
  hl_mode = "combine",
}
vim.g.gitblame_set_extmark_options = { priority = 7 }

return {
  "lewis6991/gitsigns.nvim",
  dependencies = {
    "f-person/git-blame.nvim",
    {
      "akinsho/git-conflict.nvim",
      enabled = true,
      init = function()
        vim.api.nvim_create_autocmd("User", {
          pattern = "GitConflictDetected",
          callback = function()
            vim.fn.execute("IBLDisable")
          end,
        })
        vim.api.nvim_create_autocmd("User", {
          pattern = "GitConflictResolved",
          callback = function()
            vim.fn.execute("IBLEnable")
          end,
        })
      end,
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
      border = { "", "─", "", "", "", "─", "", "" },
      style = "minimal",
      relative = "cursor",
      row = 1,
      col = 0,
      width = vim.opt.columns:get(),
      height = math.floor(vim.opt.lines:get() / 3),
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

      -- git conflict
      map("n", "<leader>gcq", "<cmd>GitConflictListQf<cr>", { desc = "Git Conflict - Quickfix" })
      map("n", "<leader>gcr", "<cmd>GitConflictRefresh<cr>", { desc = "Git Conflict - Refresh" })
      map("n", "<leader>gco", "<Plug>(git-conflict-ours)", { desc = "Git Conflict - Choose Ours" })
      map("n", "<leader>gct", "<Plug>(git-conflict-theirs)", { desc = "Git Conflict - Choose Theirs" })
      map("n", "<leader>gcb", "<Plug>(git-conflict-both)", { desc = "Git Conflict - Choose Both" })
      map("n", "<leader>gc0", "<Plug>(git-conflict-none)", { desc = "Git Conflict - Choose None" })

      map("n", "[x", "<Plug>(git-conflict-prev-conflict)", { desc = "Git Conflict - Prev" })
      map("n", "]x", "<Plug>(git-conflict-next-conflict)", { desc = "Git Conflict - Next" })
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
