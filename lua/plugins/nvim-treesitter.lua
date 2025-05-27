return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",
  config = function()
    local treesitter = require("nvim-treesitter")
    local ts_config = require("nvim-treesitter.config")
    treesitter.setup({
      -- Directory to install parsers and queries to
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    local ensure_installed = {
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
    }
    local already_installed = ts_config.installed_parsers()
    local parsers_to_install = vim
      .iter(ensure_installed)
      :filter(function(parser)
        return not vim.tbl_contains(already_installed, parser)
      end)
      :totable()
    treesitter.install(parsers_to_install)

    -- Auto-install and start parsers for any buffer
    vim.api.nvim_create_autocmd({ "BufRead", "FileType" }, {
      desc = "Enable Treesitter",
      callback = function(event)
        local bufnr = event.buf
        local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })

        -- Skip if no filetype
        if filetype == "" then
          return
        end

        -- Get parser name based on filetype
        local parser_name = vim.treesitter.language.get_lang(filetype)
        if not parser_name then
          vim.notify(vim.inspect("No treesitter parser found for filetype: " .. filetype), vim.log.levels.WARN)
          return
        end

        -- Try to get existing parser
        local parser_configs = require("nvim-treesitter.parsers")
        if not parser_configs[parser_name] then
          return -- Parser not available, skip silently
        end

        local parser_exists = pcall(vim.treesitter.get_parser, bufnr, parser_name)

        if not parser_exists then
          -- check if parser is already installed
          if vim.tbl_contains(already_installed, parser_name) then
            vim.notify("Parser for " .. parser_name .. " already installed.", vim.log.levels.INFO)
          else
            -- If not installed, install parser synchronously
            vim.notify("Installing parser for " .. parser_name, vim.log.levels.INFO)
            treesitter.install({ parser_name }):await() -- wait max. 5 minutes
          end
        end

        -- Start treesitter for this buffer
        -- vim.notify(vim.inspect("Starting treesitter parser " .. parser_name .. " for filetype: " .. filetype), vim.log.levels.WARN)
        vim.treesitter.start(bufnr, parser_name)
        -- Use regex based syntax-highlighting as fallback as some plugins might need it
        -- vim.bo[bufnr].syntax = "ON"
        -- Use treesitter for folds
        vim.wo.foldmethod = "expr"
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        -- Use treesitter for indentation
        vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
  dependencies = {
    { "nvim-treesitter/nvim-treesitter-context", opts = {} },
  },
}
