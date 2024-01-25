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
          sign = { name = { "Dap*" }, maxwidth = 1, colwidth = 2, auto = true },
          click = "v:lua.ScLa",
        },
        {
          text = {
            builtin.lnumfunc,
          },
          sign = { auto = true },
          click = "v:lua.ScLa",
        },
        {
          sign = { namespace = { "gitsigns" }, maxwidth = 1, colwidth = 1, auto = true },
          click = "v:lua.ScSa",
        },
        -- { text = { "%s" }, click = "v:lua.ScSa" },
      },
    })
  end,
}
