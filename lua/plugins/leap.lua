return {
  "ggandor/leap.nvim",
  enabled = false,
  dependencies = {
    {
      "ggandor/flit.nvim",
      opts = {
        keys = { f = "f", F = "F", t = "t", T = "T" },
        -- A string like "nv", "nvo", "o", etc.
        labeled_modes = "v",
        multiline = true,
        -- Like `leap`s similar argument (call-specific overrides).
        -- E.g.: opts = { equivalence_classes = {} }
        opts = {},
      },
    },
  },
  config = function()
    local leap = require("leap")
    -- leap.add_default_mappings(true)

    leap.opts.case_sensitive = true
    leap.opts.highlight_unlabeled_phase_one_targets = true
    -- leap.opts.equivalence_classes = {
    --   { 'a', "á", "`" },
    -- }
    -- substitute_chars = {
    --   ["\n"] = "¬",
    --   [" "] = "⋅",
    -- },
    leap.opts.special_keys = {
      repeat_search = "<enter>",
      next_phase_one_target = "<enter>",
      next_target = { "<enter>", ";" },
      prev_target = { "<tab>", "," },
      next_group = "<space>",
      prev_group = "<tab>",
      multi_accept = "<enter>",
      multi_revert = "<backspace>",
    }

    vim.keymap.set({ "n" }, "s", "<Plug>(leap-forward-to)", { silent = true })
    vim.keymap.set({ "n" }, "S", "<Plug>(leap-backward-to)", { silent = true })
    vim.keymap.set({ "x", "o" }, "zi", "<Plug>(leap-forward-till)", { silent = true })
    vim.keymap.set({ "x", "o" }, "Zi", "<Plug>(leap-backward-till)", { silent = true })
    vim.keymap.set({ "x", "o" }, "za", "<Plug>(leap-forward-to)", { silent = true })
    vim.keymap.set({ "x", "o" }, "Za", "<Plug>(leap-backward-to)", { silent = true })
    vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-cross-window)", { silent = true })

    vim.api.nvim_create_autocmd("User", {
      pattern = "LeapEnter",
      command = "nohlsearch",
    })
    vim.api.nvim_create_autocmd("User", {
      pattern = "LeapLeave",
      command = "let &hlsearch=&hlsearch",
    })
    -- vim.api.nvim_create_autocmd("User", {
    --   pattern = "LeapEnter",
    --   callback = function()
    --     require("incline").disable()
    --   end,
    -- })
    -- vim.api.nvim_create_autocmd("User", {
    --   pattern = "LeapLeave",
    --   callback = function()
    --     require("incline").enable()
    --   end,
    -- })
  end,
}
