return {
  "sainnhe/gruvbox-material",
  enabled = true,
  lazy = false,
  priority = 1000,
  config = function()
    local utils = require("utils")

    utils.sourceVim("gruvbox-material.vim")
  end,
}
