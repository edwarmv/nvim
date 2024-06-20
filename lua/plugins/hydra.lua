local defaults = require("config.defaults")

return {
  "nvimtools/hydra.nvim",
  config = function()
    local Hydra = require("hydra")

    Hydra({
      config = {
        hint = {
          type = "statusline",
        },
        on_enter = function()
          vim.api.nvim_command("IBLDisable")
        end,
        on_exit = function()
          vim.api.nvim_command("IBLEnable")
        end,
        timeout = true,
      },
      name = "Side scroll",
      mode = "n",
      body = "z",
      heads = {
        { "h", "zh" },
        { "l", "zl", { desc = "←/→" } },
        { "H", "zH" },
        { "L", "zL", { desc = "half screen ←/→" } },
      },
    })

    Hydra({
      config = {
        hint = {
          type = "statusline",
        },
        timeout = true,
      },
      name = "Move cursor by display lines",
      mode = "n",
      body = "g",
      heads = {
        { "j", "gj" },
        { "k", "gk", { desc = "↓/↑" } },
      },
    })

    -- Hydra({
    --   config = {
    --     hint = {
    --       type = "statusline",
    --     },
    --   },
    --   mode = "n",
    --   body = "]",
    --   heads = {
    --     { "d", "]d", { desc = "Next diagnostic" } },
    --     -- { "c", "]c", { desc = "Next hunk" } },
    --     { "w", "]w", { desc = "Next trailing whitespace" } },
    --     { "t", "<cmd>tabnext<cr>", { desc = "Next tab" } },
    --   },
    -- })

    -- Hydra({
    --   config = {
    --     hint = {
    --       type = "statusline",
    --     },
    --   },
    --   mode = "n",
    --   body = "[",
    --   heads = {
    --     { "d", "[d", { desc = "Prev diagnostic" } },
    --     -- { "c", "[c", { desc = "Prev hunk" } },
    --     { "w", "[w", { desc = "Prev trailing whitespace" } },
    --     { "t", "<cmd>tabprevious<cr>", { desc = "Prev tab" } },
    --   },
    -- })

    Hydra({
      config = {
        hint = {
          type = "statusline",
        },
        timeout = false,
      },
      mode = "n",
      body = "<c-w>",
      heads = {
        { ">", "<c-w>>" },
        { "<", "<c-w><" },
        { "+", "<c-w>+" },
        { "-", "<c-w>-" },
        -- { "h", "<c-w>h" },
        -- { "j", "<c-w>j" },
        -- { "k", "<c-w>k" },
        -- { "l", "<c-w>l" },
      },
    })

    local hint = [[
  ^ ^        Options
  ^
  _v_ %{ve} virtual edit
  _i_ %{list} invisible characters  
  _s_ %{spell} spell
  _w_ %{wrap} wrap
  _c_ %{cul} cursor line
  _n_ %{nu} number
  _r_ %{rnu} relative number
  ^
       ^^^^                _<Esc>_
]]

    Hydra({
      name = "Options",
      hint = hint,
      config = {
        color = "amaranth",
        invoke_on_body = true,
        hint = {
          position = "middle",
          float_opts = {
            border = "rounded",
          },
        },
      },
      mode = { "n", "x" },
      body = "<space>O",
      heads = {
        {
          "n",
          function()
            if vim.o.number == true then
              vim.o.number = false
            else
              vim.o.number = true
            end
          end,
          { desc = "number" },
        },
        {
          "r",
          function()
            if vim.o.relativenumber == true then
              vim.o.relativenumber = false
            else
              vim.o.number = true
              vim.o.relativenumber = true
            end
          end,
          { desc = "relativenumber" },
        },
        {
          "v",
          function()
            if vim.o.virtualedit == "all" then
              vim.o.virtualedit = "block"
            else
              vim.o.virtualedit = "all"
            end
          end,
          { desc = "virtualedit" },
        },
        {
          "i",
          function()
            if vim.o.list == true then
              vim.o.list = false
            else
              vim.o.list = true
            end
          end,
          { desc = "show invisible" },
        },
        {
          "s",
          function()
            if vim.o.spell == true then
              vim.o.spell = false
            else
              vim.o.spell = true
            end
          end,
          { desc = "spell" },
        },
        {
          "w",
          function()
            if vim.o.wrap ~= true then
              vim.o.wrap = true
              -- Dealing with word wrap:
              -- If cursor is inside very long line in the file than wraps
              -- around several rows on the screen, then 'j' key moves you to
              -- the next line in the file, but not to the next row on the
              -- screen under your previous position as in other editors. These
              -- bindings fixes this.
              -- vim.keymap.set("n", "k", function()
              --   return vim.v.count > 0 and "k" or "gk"
              -- end, { expr = true, desc = "k or gk" })
              -- vim.keymap.set("n", "j", function()
              --   return vim.v.count > 0 and "j" or "gj"
              -- end, { expr = true, desc = "j or gj" })
            else
              vim.o.wrap = false
              -- vim.keymap.del("n", "k")
              -- vim.keymap.del("n", "j")
            end
          end,
          { desc = "wrap" },
        },
        {
          "c",
          function()
            if vim.o.cursorline == true then
              vim.o.cursorline = false
            else
              vim.o.cursorline = true
            end
          end,
          { desc = "cursor line" },
        },
        { "<Esc>", nil, { exit = true } },
      },
    })
  end,
}
