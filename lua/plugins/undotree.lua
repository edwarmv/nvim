vim.g.undotree_CustomDiffpanelCmd = "botright 10 new"
return {
  "mbbill/undotree",
  enabled = false,
  keys = {
    { "<space>y", "<cmd>UndotreeToggle<cr>", desc = "Undotree - Toggle" },
  },
}
