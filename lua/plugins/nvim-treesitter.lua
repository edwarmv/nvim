return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    {
      "nvim-treesitter/playground",
    },
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    {
      "windwp/nvim-ts-autotag",
    },
    -- "nvim-treesitter/nvim-treesitter-angular",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "cpp",
        "graphql",
        "typescript",
        "javascript",
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
        "bash",
        "regex",
        "markdown",
        "markdown_inline",
        "python",
        "sql",
        "gitcommit",
        "gitignore",
        "git_rebase",
        "gitattributes",
        "dockerfile",
        "dart",
        -- "norg",
        -- "norg_meta",
        -- "norg_table",
      },
      highlight = {
        enable = true,
        -- disable = { "dart", "html" },
        -- additional_vim_regex_highlighting = { "html" },
      },
      indent = {
        enable = true,
        disable = { "dart" },
      },
      playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
          toggle_query_editor = "o",
          toggle_hl_groups = "i",
          toggle_injected_languages = "t",
          toggle_anonymous_nodes = "a",
          toggle_language_display = "I",
          focus_language = "f",
          unfocus_language = "F",
          update = "R",
          goto_node = "<cr>",
          show_help = "?",
        },
      },
      matchup = {
        enable = true,
        disable_virtual_text = true,
      },
      autotag = {
        enable = true,
      },
      context_commentstring = {
        enable = true,
      },
    })
    local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

    parser_configs.norg_meta = {
      install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
        files = { "src/parser.c" },
        branch = "main",
      },
    }

    parser_configs.norg_table = {
      install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
        files = { "src/parser.c" },
        branch = "main",
      },
    }

    parser_configs.sql = {
      install_info = {
        url = "https://github.com/m-novikov/tree-sitter-sql",
        files = { "src/parser.c" },
        branch = "main",
      },
    }

    -- parser_configs.scss = {
    --   install_info = {
    --     url = "~/github/tree-sitter-scss", -- local path or git repo
    --     files = { "src/parser.c", "src/scanner.c" },
    --   },
    -- }

    -- parser_configs.jsdoc = {
    --   install_info = {
    --     url = "~/github/tree-sitter/tree-sitter-jsdoc", -- local path or git repo
    --     files = { "src/parser.c" },
    --   },
    -- }

    -- parser_config.viml = {
    --   install_info = {
    --     url = "https://github.com/vigoux/tree-sitter-viml", -- local path or git repo
    --     files = {"src/parser.c", "src/scanner.c"}
    --   },
    --   filetype = "vim"
    -- }

    -- parser_configs.graphql = {
    --   install_info = {
    --     url = "~/github/tree-sitter/tree-sitter-graphql", -- local path or git repo
    --     files = {"src/parser.c"}
    --   },
    -- }
  end,
}
