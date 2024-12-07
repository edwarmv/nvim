return {
  "luukvbaal/statuscol.nvim",
  enabled = true,
  config = function()
    local builtin = require("statuscol.builtin")
    require("statuscol").setup({
      ft_ignore = {
        "NvimTree",
        "Neogit*",
        "trouble",
        "neo-tree",
        "aerial",
        "diff",
        "undotree",
        "qf",
        "quickfix",
        "toggleterm",
      },
      segments = {
        -- {
        --   sign = { name = { "todo*" }, maxwidth = 1, colwidth = 2, auto = true },
        -- },
        -- {
        --   sign = { name = { "Dap*" }, maxwidth = 1, colwidth = 2, auto = true },
        --   click = "v:lua.ScLa",
        -- },
        {
          sign = {
            namespace = { ".*" },
            name = { ".*" },
            maxwidth = 1,
            colwidth = 2,
            auto = false,
          },
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
          sign = {
            namespace = { "gitsigns" },
            maxwidth = 1,
            colwidth = 1,
            auto = false,
          },
          click = "v:lua.ScSa",
        },
        {
          text = { builtin.foldfunc },
          click = "v:lua.ScFa",
        },
      },
    })
  end,
}
