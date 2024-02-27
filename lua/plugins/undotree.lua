vim.g.undotree_CustomDiffpanelCmd = "botright 10 new"
return {
  "mbbill/undotree",
  keys = {
    { "<space>y", "<cmd>UndotreeToggle<cr>", desc = "Undotree - Toggle" },
  },
}
