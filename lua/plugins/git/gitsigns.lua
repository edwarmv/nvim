return {
  "lewis6991/gitsigns.nvim",
  opts = {
    preview_config = {
      border = vim.o.winborder,
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
      map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "[Gitsigns] Stage Hunk" })
      map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "[Gitsigns] Reset Hunk" })
      map("v", "<leader>gs", function()
        gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = "[Gitsigns] Stage Hunk" })
      map("v", "<leader>gr", function()
        gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = "[Gitsigns] Reset Hunk" })
      map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "[Gitsigns] Stage Buffer" })
      map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "[Gitsigns] Reset Buffer" })
      map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "[Gitsigns] Preview Hunk" })
      map("n", "<leader>gP", gitsigns.preview_hunk_inline, { desc = "[Gitsigns] Preview Hunk Inline" })
      map("n", "<leader>gq", gitsigns.setloclist, { desc = "[Gitsigns] Quifix" })
      map("n", "<leader>gD", gitsigns.diffthis, { desc = "[Gitsigns] Diff This" })
      map("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", { desc = "[GitSigns] - Toggle Blame" })
      map("n", "<leader>gw", "<cmd>Gitsigns toggle_word_diff<cr>", { desc = "[GitSigns] - Toggle Word Diff" })
      map({ "o", "x" }, "ig", ":<C-U>Gitsigns select_hunk<CR>", { silent = true })
      map("n", "<leader>gc", function()
        local all = vim.fn.systemlist({ "git", "rev-parse", "--symbolic", "--branches", "--tags", "--remotes" })
        local original_base = "Original base"
        table.insert(all, 1, original_base)
        vim.ui.select(all, {
          prompt = "Select branch",
        }, function(choice)
          if choice == nil then
            return
          elseif choice == original_base then
            choice = nil
          end
          gitsigns.change_base(choice, true)
        end)
      end, { desc = "[Gitsigns] Diff This" })
    end,
  },
}
