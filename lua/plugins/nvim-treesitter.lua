return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    init = function()
      vim.g.loaded_nvim_treesitter = 1
    end,
    build = ":TSUpdate",
    lazy = false,
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        desc = "Enable Treesitter",
        group = vim.api.nvim_create_augroup("enable_treesitter", {}),
        callback = function()
          if pcall(vim.treesitter.start) then
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            vim.wo.foldmethod = "expr"
            vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          end
        end,
      })
    end,
  },
  { "nvim-treesitter/nvim-treesitter-context", opts = {} },
  {
    "lewis6991/ts-install.nvim",
    opts = {
      auto_install = true,
      install_dir = vim.fn.stdpath("data") .. "/site",
      ensure_install = {
        "cpp",
        "graphql",
        "typescript",
        "javascript",
        "jsdoc",
        "tsx",
        "java",
        "css",
        "scss",
        "json",
        "jsonc",
        "json5",
        "yaml",
        "http",
        "html",
        "lua",
        "fish",
        "comment",
        "vim",
        "vimdoc",
        "bash",
        "regex",
        "markdown",
        "markdown_inline",
        "mermaid",
        "python",
        "sql",
        "gitcommit",
        "gitignore",
        "git_rebase",
        "diff",
        "gitattributes",
        "dockerfile",
        "dart",
        "angular",
        "astro",
        "rust",
        "xml",
      },
    },
  },
}
