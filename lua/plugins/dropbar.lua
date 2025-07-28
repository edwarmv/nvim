local defaults = require("config.defaults")

local exclude_ft = {
  "oil",
}

return {
  "Bekaboo/dropbar.nvim",
  enabled = false,
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  event = "VimEnter",
  opts = {
    bar = {
      -- enable = function(buf, win)
      --   return vim.fn.buflisted(buf) == 1
      --     and vim.fn.win_gettype(win) == ""
      --     and vim.wo[win].winbar == ""
      --     and vim.bo[buf].bt == ""
      --     and vim.api.nvim_buf_get_name(buf) ~= ""
      --     and not vim.tbl_contains(exclude_ft, vim.bo[buf].ft)
      -- end,
      update_interval = defaults.lsp_debounce,
    },
    menu = {
      keymaps = {
        ["H"] = function()
          local root = require("dropbar.utils").menu.get_current():root()
          root:close()

          local dropbar = require("dropbar.api").get_dropbar(vim.api.nvim_win_get_buf(root.prev_win), root.prev_win)
          if not dropbar then
            root:toggle()
            return
          end

          local current_idx
          for idx, component in ipairs(dropbar.components) do
            if component.menu == root then
              current_idx = idx
              break
            end
          end

          if current_idx == nil or current_idx == 0 then
            root:toggle()
            return
          end

          vim.defer_fn(function()
            dropbar:pick(current_idx - 1)
          end, 100)
        end,

        ["L"] = function()
          local root = require("dropbar.utils").menu.get_current():root()
          root:close()

          local dropbar = require("dropbar.api").get_dropbar(vim.api.nvim_win_get_buf(root.prev_win), root.prev_win)
          if not dropbar then
            dropbar = require("dropbar.utils").bar.get_current()
            if not dropbar then
              root:toggle()
              return
            end
          end

          local current_idx
          for idx, component in ipairs(dropbar.components) do
            if component.menu == root then
              current_idx = idx
              break
            end
          end

          if current_idx == nil or current_idx == #dropbar.components then
            root:toggle()
            return
          end

          vim.defer_fn(function()
            dropbar:pick(current_idx + 1)
          end, 100)
        end,
      },
    },
    icons = {
      kinds = {
        symbols = {
          Text = " ",
          Method = " ",
          Function = " ",
          Constructor = " ",
          Field = " ",
          Variable = " ",
          Class = " ",
          Interface = " ",
          Module = " ",
          Property = " ",
          Unit = " ",
          Value = " ",
          Enum = " ",
          Keyword = " ",
          Snippet = " ",
          Color = " ",
          File = " ",
          Reference = " ",
          Folder = " ",
          EnumMember = " ",
          Constant = " ",
          Struct = " ",
          Event = " ",
          Operator = " ",
          TypeParameter = " ",
        },
      },
    },
  },
  keys = {
    {
      "<leader>w",
      function()
        require("dropbar.api").pick()
      end,
      desc = "Dropbar - Pick",
    },
    {
      "[;",
      function()
        require("dropbar.api").goto_context_start()
      end,
      desc = "Go to start of current context",
    },
    {
      "];",
      function()
        require("dropbar.api").select_next_context()
      end,
      desc = "Select next context",
    },
  },
}
