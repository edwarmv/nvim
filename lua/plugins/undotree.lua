vim.g.undotree_CustomDiffpanelCmd = "botright 10 new"
return {
  "mbbill/undotree",
  enabled = true,
  keys = {
    { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undotree - Toggle" },
  },
}
