local defaults = require("config.defaults")

return {
  "nvimtools/hydra.nvim",
  dependencies = { "hrsh7th/nvim-cmp" },
  config = function()
    local Hydra = require("hydra")
    local timeout = 1000

    Hydra({
      config = {
        hint = {
          type = "window",
          offset = -1,
        },
        -- on_enter = function()
        --   vim.cmd("IBLDisable")
        -- end,
        -- on_exit = function()
        --   vim.cmd("IBLEnable")
        -- end,
        timeout = timeout,
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
  _S_ scroll bind
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
        {
          "S",
          function()
            if vim.o.scrollbind == true then
              vim.o.scrollbind = false
            else
              vim.o.scrollbind = true
            end
          end,
          { desc = "scroll bind", exit = true },
        },
        { "<Esc>", nil, { exit = true } },
      },
    })

    local cmp = require("cmp")

    Hydra({
      name = "cmp",
      config = {
        hint = {
          type = "window",
          offset = -1,
        },
        invoke_on_body = true,
        timeout = false,
      },
      mode = "i",
      body = "<c-x>",
      heads = {
        {
          "s",
          function()
            if cmp.visible() then
              cmp.close()
            end
            cmp.complete({
              config = {
                sources = {
                  { name = "luasnip" },
                },
              },
            })
          end,
          { desc = "snippets", exit = true },
        },
        {
          "p",
          function()
            if cmp.visible() then
              cmp.close()
            end
            cmp.complete({
              config = {
                sources = {
                  { name = "path" },
                },
              },
            })
          end,
          { desc = "path", exit = true },
        },
        {
          "c",
          function()
            if cmp.visible() then
              cmp.close()
            end
            cmp.complete({
              config = {
                sources = {
                  { name = "calc" },
                },
              },
            })
          end,
          { desc = "calc", exit = true },
        },
        {
          "y",
          function()
            if cmp.visible() then
              cmp.close()
            end
            cmp.complete({
              config = {
                sources = {
                  {
                    name = "cmp_yanky",
                  },
                },
              },
            })
          end,
          { desc = "yanky", exit = true },
        },
        {
          "E",
          function()
            if cmp.visible() then
              cmp.close()
            end
            cmp.complete({
              config = {
                sources = {
                  {
                    name = "emoji",
                  },
                },
              },
            })
          end,
          { desc = "Emoji", exit = true },
        },
        {
          "e",
          function()
            if cmp.visible() then
              cmp.close()
            end
            cmp.complete({
              config = {
                sources = {
                  {
                    name = "emmet_vim",
                    option = {
                      filetypes = {
                        "html",
                        "xml",
                        "typescriptreact",
                        "javascriptreact",
                        "javascript",
                        "css",
                        "sass",
                        "scss",
                        "less",
                        "heex",
                        "tsx",
                        "jsx",
                      },
                    },
                  },
                },
              },
            })
          end,
          { desc = "emmet", exit = true },
        },
      },
    })
  end,
}
