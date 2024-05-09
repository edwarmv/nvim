return {
  "luukvbaal/statuscol.nvim",
  enabled = true,
  branch = "0.10",
  config = function()
    local builtin = require("statuscol.builtin")
    require("statuscol").setup({
      relculright = false,
      segments = {
        {
          text = { builtin.foldfunc },
          click = "v:lua.ScFa",
          sign = { colwidth = 1, auto = true },
        },
        -- {
        --   sign = { name = { "todo*" }, maxwidth = 1, colwidth = 2, auto = true },
        -- },
        {
          sign = { name = { "Dap*" }, maxwidth = 1, colwidth = 2, auto = true },
          click = "v:lua.ScLa",
        },
        {
          sign = { namespace = { "diagnostic", "Dap*" }, maxwidth = 1, colwidth = 2, auto = true },
          click = "v:lua.ScSa",
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
        -- {
        --   sign = { name = { ".*" }, auto = true },
        --   click = "v:lua.ScSa",
        -- },
        {
          text = { " " },
        },
      },
    })
  end,
}
