return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    {
      "nvim-treesitter/playground",
    },
    {
      "windwp/nvim-ts-autotag",
    },
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
        "vimdoc",
        "bash",
        "regex",
        "markdown",
        "markdown_inline",
        "python",
        "sql",
        "gitcommit",
        "gitignore",
        "git_rebase",
        "diff",
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
        enable_quotes = true,
        include_match_words = true,
      },
      autotag = {
        enable = true,
      },
    })
  end,
}
