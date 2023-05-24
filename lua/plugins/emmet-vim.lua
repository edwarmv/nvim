return {
  "mattn/emmet-vim",
  dependencies = { "hrsh7th/nvim-cmp", "dcampos/cmp-emmet-vim" },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      mapping = {
        ["<c-x><c-e>"] = cmp.mapping({
          i = function()
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
        }),
      },
    })
  end,
  event = "VimEnter",
}
