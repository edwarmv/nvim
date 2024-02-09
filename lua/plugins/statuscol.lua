return {
  "luukvbaal/statuscol.nvim",
  enabled = false,
  config = function()
    local builtin = require("statuscol.builtin")
    require("statuscol").setup({
      ft_ignore = { "neo-tree", "Trouble", "NeogitStatus" },
      relculright = true,
      segments = {
        {
          text = { builtin.foldfunc },
          click = "v:lua.ScFa",
          sign = { colwidth = 2, auto = true },
        },
        {
          sign = { name = { "todo*" }, maxwidth = 1, colwidth = 2, auto = true },
        },
        {
          sign = { namespace = { "dap" }, maxwidth = 1, colwidth = 2, auto = true },
          click = "v:lua.ScLa",
        },
        {
          sign = { namespace = { "diagnostic" }, maxwidth = 1, colwidth = 2, auto = true },
          click = "v:lua.ScSa",
        },
        {
          sign = { namespace = { "gitsigns" }, maxwidth = 1, colwidth = 1, auto = true, wrap = true },
          click = "v:lua.ScSa",
        },
        {
          text = {
            builtin.lnumfunc,
          },
          sign = { auto = true },
          click = "v:lua.ScLa",
        },
        { text = { " " }, condition = { builtin.not_empty } },
        -- { text = { "%s" }, click = "v:lua.ScSa" },
      },
    })
  end,
}
