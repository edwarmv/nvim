return {
  "luukvbaal/statuscol.nvim",
  enabled = true,
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
          text = { builtin.foldfunc },
          click = "v:lua.ScFa",
          sign = { colwidth = 2, auto = true },
        },
        {
          sign = { name = { "todo*" }, maxwidth = 1, colwidth = 2, auto = true },
        },
        {
          sign = { namespace = { "diagnostic" }, maxwidth = 1, colwidth = 2, auto = true },
          click = "v:lua.ScSa",
        },
        {
          sign = { namespace = { "gitsigns" }, maxwidth = 1, auto = true, wrap = true },
          click = "v:lua.ScSa",
        },
        {
          text = {
            builtin.lnumfunc,
            " ",
          },
          condition = {
            true,
            function(args)
              return (args.nu or args.rnu)
            end,
          },
          sign = { auto = true },
          click = "v:lua.ScLa",
        },
        -- { text = { "%s" }, click = "v:lua.ScSa" },
      },
    })
  end,
}
