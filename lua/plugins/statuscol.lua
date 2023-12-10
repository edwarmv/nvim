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
          sign = { name = { "Dap*" }, maxwidth = 1, colwidth = 1, auto = true },
          click = "v:lua.ScLa",
        },
        {
          text = { builtin.foldfunc, " " },
          condition = {
            true,
            function(args)
              return args.fold.width > 0
            end,
          },
          click = "v:lua.ScFa",
          sign = { colwidth = 1, auto = true },
        },
        {
          sign = { name = { "todo*" }, maxwidth = 1, colwidth = 2, auto = true },
        },
        {
          sign = { name = { "Diagnostic" }, maxwidth = 1, colwidth = 2, auto = true },
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
              return (args.nu or args.rnu) and (vim.b.gitsigns_status == nil or vim.b.gitsigns_status == "")
            end,
          },
          sign = { auto = true },
          click = "v:lua.ScLa",
        },
        {
          sign = { namespace = { "gitsigns" }, maxwidth = 1, auto = true, wrap = true },
          click = "v:lua.ScSa",
        },
        -- { text = { "%s" }, click = "v:lua.ScSa" },
      },
    })
  end,
}
