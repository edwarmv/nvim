vim.o.laststatus = 3
-- vim.o.cmdheight = 0
local fn = vim.fn
local bo = vim.bo
local api = vim.api

local vi_mode = require("feline.providers.vi_mode")

-- local mode_alias = {{{{
--   ["n"] = "N",
--   ["no"] = "OP",
--   ["nov"] = "OP",
--   ["noV"] = "OP",
--   ["no\22"] = "OP",
--   ["niI"] = "N",
--   ["niR"] = "N",
--   ["niV"] = "N",
--   ["nt"] = "N",
--   ["ntT"] = "N",
--   ["v"] = "V",
--   ["vs"] = "V",
--   ["V"] = "VL",
--   ["Vs"] = "VL",
--   ["\22"] = "VB",
--   ["\22s"] = "VB",
--   ["s"] = "S",
--   ["S"] = "SL",
--   ["\19"] = "SB",
--   ["i"] = "I",
--   ["ic"] = "I",
--   ["ix"] = "I",
--   ["R"] = "R",
--   ["Rc"] = "R",
--   ["Rx"] = "R",
--   ["Rv"] = "VR",
--   ["Rvc"] = "VR",
--   ["Rvx"] = "VR",
--   ["c"] = "C",
--   ["cv"] = "EX",
--   ["ce"] = "EX",
--   ["r"] = "E",
--   ["rm"] = "M",
--   ["r?"] = "C?",
--   ["!"] = "SH",
--   ["t"] = "T",
--   ["null"] = "NO",
-- }}}}

local mode_alias = {--{{{
  ["n"] = "NORMAL",
  ["no"] = "O-PENDING",
  ["nov"] = "O-PENDING",
  ["noV"] = "O-PENDING",
  ["no\22"] = "O-PENDING",
  ["niI"] = "NORMAL",
  ["niR"] = "NORMAL",
  ["niV"] = "NORMAL",
  ["nt"] = "NORMAL",
  ["ntT"] = "NORMAL",
  ["v"] = "VISUAL",
  ["vs"] = "VISUAL",
  ["V"] = "V-LINE",
  ["Vs"] = "V-LINE",
  ["\22"] = "V-BLOCK",
  ["\22s"] = "V-BLOCK",
  ["s"] = "SELECT",
  ["S"] = "S-LINE",
  ["\19"] = "S-BLOCK",
  ["i"] = "INSERT",
  ["ic"] = "INSERT",
  ["ix"] = "INSERT",
  ["R"] = "REPLACE",
  ["Rc"] = "REPLACE",
  ["Rx"] = "REPLACE",
  ["Rv"] = "V-REPLACE",
  ["Rvc"] = "V-REPLACE",
  ["Rvx"] = "V-REPLACE",
  ["c"] = "COMMAND",
  ["cv"] = "EX",
  ["ce"] = "EX",
  ["r"] = "ENTER",
  ["rm"] = "MORE",
  ["r?"] = "CONFIRM",
  ["!"] = "SHELL",
  ["t"] = "TERMINAL",
  ["null"] = "NONE",
}--}}}

function vi_mode.get_vim_mode()
  return mode_alias[vim.api.nvim_get_mode().mode]
end

local file_provider = require("feline.providers.file")

--{{{
-- Get the names of all current listed buffers
local function get_current_filenames()
    local listed_buffers = vim.tbl_filter(function(bufnr)
        return bo[bufnr].buflisted and api.nvim_buf_is_loaded(bufnr)
    end, api.nvim_list_bufs())

    return vim.tbl_map(api.nvim_buf_get_name, listed_buffers)
end

-- Get unique name for the current buffer
local function get_unique_filename(filename, shorten)
    local filenames = vim.tbl_filter(function(filename_other)
        return filename_other ~= filename
    end, get_current_filenames())

    if shorten then
        filename = fn.pathshorten(filename)
        filenames = vim.tbl_map(fn.pathshorten, filenames)
    end

    -- Reverse filenames in order to compare their names
    filename = string.reverse(filename)
    filenames = vim.tbl_map(string.reverse, filenames)

    local index

    -- For every other filename, compare it with the name of the current file char-by-char to
    -- find the minimum index `i` where the i-th character is different for the two filenames
    -- After doing it for every filename, get the maximum value of `i`
    if next(filenames) then
        index = math.max(unpack(vim.tbl_map(function(filename_other)
            for i = 1, #filename do
                -- Compare i-th character of both names until they aren't equal
                if filename:sub(i, i) ~= filename_other:sub(i, i) then
                    return i
                end
            end
            return 1
        end, filenames)))
    else
        index = 1
    end

    -- Iterate backwards (since filename is reversed) until a "/" is found
    -- in order to show a valid file path
    while index <= #filename do
        if filename:sub(index, index) == '/' then
            index = index - 1
            break
        end

        index = index + 1
    end

    return string.reverse(string.sub(filename, 1, index))
end
--}}}

--{{{
function file_provider.file_info(component, opts)
    local readonly_str, modified_str, icon

    -- Avoid loading nvim-web-devicons if an icon is provided already
    if not component.icon then
        local icon_str, icon_color = require('nvim-web-devicons').get_icon_color(
            fn.expand('%:t'),
            nil, -- extension is already computed by nvim-web-devicons
            { default = true }
        )

        icon = { str = icon_str }

        if opts.colored_icon == nil or opts.colored_icon then
            icon.hl = { fg = icon_color }
        end
    end

    local filename = api.nvim_buf_get_name(0)
    local type = opts.type or 'base-only'
    if filename == '' then
        filename = '[No Name]'
    elseif type == 'short-path' then
        filename = fn.pathshorten(filename)
    elseif type == 'base-only' then
        filename = fn.fnamemodify(filename, ':t')
    elseif type == 'relative' then
        filename = fn.fnamemodify(filename, ':~:.')
    elseif type == 'relative-short' then
        filename = fn.pathshorten(fn.fnamemodify(filename, ':~:.'))
    elseif type == 'unique' then
        filename = get_unique_filename(filename)
    elseif type == 'unique-short' then
        filename = get_unique_filename(filename, true)
    elseif type ~= 'full-path' then
        filename = fn.fnamemodify(filename, ':t')
    end

    if bo.readonly then
        readonly_str = ' ' .. opts.file_readonly_icon or ' ' .. '🔒'
    else
        readonly_str = ''
    end

    -- Add a space at the beginning of the provider if there is an icon
    -- if (icon and icon ~= '') or (component.icon and component.icon ~= '') then
    --     readonly_str = ' ' .. readonly_str
    -- end

    if bo.modified then
        modified_str = opts.file_modified_icon or '●'

        if modified_str ~= '' then
            modified_str = ' ' .. modified_str
        end
    else
        modified_str = ''
    end

    -- escape any special statusline characters in the filename
    filename = filename:gsub('%%', '%%%%')
    return string.format('%s%s%s', filename, readonly_str, modified_str), icon
end
--}}}

local configuration = vim.fn["gruvbox_material#get_configuration"]()
local palette = vim.fn["gruvbox_material#get_palette"](
  configuration.background,
  configuration.foreground,
  configuration.colors_override
)
local git = require("feline.providers.git")
local lsp = require("feline.providers.lsp")

local plugin_name = function()
  local plugin_name = nil
  local plugin_ft = {
    NvimTree = "NvimTree",
    aerial = "Aerial",
    qf = "Quickfix",
    ["neo-tree"] = "Neo-tree"
  }
  local file_type = vim.api.nvim_buf_get_option(0, "filetype")
  plugin_name = plugin_ft[file_type]

  if plugin_name ~= nil then
    return plugin_name
  else
    return ""
  end
end

require("feline").setup({
  components = {
    active = { --{{{
      { --{{{
        { --{{{
          provider = {
            name = "vi_mode",
            opts = {
              show_mode_name = true,
            },
          },
          hl = function()
            return {
              name = require("feline.providers.vi_mode").get_mode_highlight_name(),
              fg = palette.bg0[1],
              bg = require("feline.providers.vi_mode").get_mode_color(),
              style = "bold",
            }
          end,
          left_sep = {
            str = " ",
            hl = function()
              return {
                bg = require("feline.providers.vi_mode").get_mode_color(),
              }
            end,
          },
          right_sep = {
            str = " ",
            hl = function()
              return {
                bg = require("feline.providers.vi_mode").get_mode_color(),
              }
            end,
          },
          icon = "",
          enabled = function()
            return plugin_name() == ""
          end,
        }, --}}}
        { --{{{
          provider = "git_branch",
          hl = {
            bg = palette.bg_statusline3[1],
          },
          left_sep = {
            str = " ",
            hl = {
              bg = palette.bg_statusline3[1],
            },
          },
          -- right_sep = {
          --   str = " ",
          --   hl = {
          --     bg = palette.bg_statusline3[1],
          --   },
          -- },
          enabled = function()
            return plugin_name() == ""
          end,
        }, --}}}
        { --{{{
          provider = "git_diff_added",
          hl = {
            fg = "green",
            bg = palette.bg_statusline3[1],
          },
          icon = " +",
        },
        {
          provider = "git_diff_changed",
          hl = {
            fg = "blue",
            bg = palette.bg_statusline3[1],
          },
          icon = " ~",
        },
        {
          provider = "git_diff_removed",
          hl = {
            fg = "red",
            bg = palette.bg_statusline3[1],
          },
          icon = " -",
        },
        {
          enabled = function()
            return git.git_info_exists()
          end,
          right_sep = {
            str = " ",
            always_visible = true,
            hl = {
              bg = palette.bg_statusline3[1],
            },
          },
        }, --}}}
        {
          provider = plugin_name,
          hl = {
            fg = "fg",
            bg = "bg",
          },
          left_sep = {
            str = " ",
          },
        },
        {
          provider = {
            name = "file_info",
            opts = {
              file_modified_icon = "[+]",
              file_readonly_icon = "[-]",
              -- type = "unique",
            },
          },
          icon = "",
          hl = {
            fg = "fg",
            bg = "bg",
          },
          left_sep = {
            str = " ",
          },
          enabled = function()
            return plugin_name() == ""
          end,
        },
        {
          enabled = function()
            return not lsp.diagnostics_exist()
          end,
          right_sep = { str = " ", always_visible = true },
        },
        { --{{{
          provider = "diagnostic_errors",
          hl = {
            fg = "red",
          },
        },
        {
          provider = "diagnostic_warnings",
          hl = {
            fg = "yellow",
          },
        },
        {
          provider = "diagnostic_hints",
          hl = {
            fg = "green",
          },
        },
        {
          provider = "diagnostic_info",
          hl = {
            fg = "blue",
          },
        },
        {
          enabled = function()
            return lsp.diagnostics_exist()
          end,
          right_sep = { str = " ", always_visible = true },
          hl = {
            bg = "red",
          },
        }, --}}}
        {
          -- provider = {
          --   name = "file_info",
          --   opts = {
          --     file_modified_icon = "[+]",
          --     file_readonly_icon = "[-]",
          --     -- type = "unique",
          --   },
          -- },
          -- icon = "",
          -- left_sep = {
          --   str = " ",
          -- },
          hl = {
            bg = "bg",
          },
        },
      }, --}}}
      {
        -- {
        --   provider = "lsp_server_name",
        --   hl = {
        --     fg = palette.grey2[1],
        --   },
        -- },
        {
          provider = function()
            return vim.fn["zoom#statusline"]()
          end,
          right_sep = {
            str = " ",
          },
          hl = {
            fg = "fg",
          },
          enabled = function()
            return plugin_name() == ""
          end,
        },
        {
          provider = function()
            return vim.fn["ObsessionStatus"]()
          end,
          right_sep = {
            str = " ",
          },
          hl = {
            fg = "fg",
          },
          enabled = function()
            return plugin_name() == ""
          end,
        },
        {
          provider = {
            name = "file_type",
            opts = {
              filetype_icon = true,
              case = "lowercase",
            },
          },
          hl = {
            fg = "fg",
          },
          right_sep = {
            str = " ",
          },
          enabled = function()
            return plugin_name() == ""
          end,
        },
        {
          provider = "line_percentage",
          hl = {
            bg = palette.bg_statusline3[1],
          },
          left_sep = {
            str = " ",
            hl = {
              bg = palette.bg_statusline3[1],
            },
          },
          right_sep = {
            str = " ",
            hl = {
              bg = palette.bg_statusline3[1],
            },
          },
          enabled = function()
            return plugin_name() == ""
          end,
        },
        -- {
        --   provider = {
        --     name = "scroll_bar",
        --     opts = {
        --       reverse = true,
        --     },
        --   },
        --   hl = function()
        --     return {
        --       fg = require("feline.providers.vi_mode").get_mode_color(),
        --     }
        --   end,
        -- },
        {
          provider = "position",
          hl = function()
            return {
              name = require("feline.providers.vi_mode").get_mode_highlight_name(),
              fg = palette.bg0[1],
              bg = require("feline.providers.vi_mode").get_mode_color(),
              style = "bold",
            }
          end,
          left_sep = {
            str = " ",
            hl = function()
              return {
                bg = require("feline.providers.vi_mode").get_mode_color(),
              }
            end,
          },
          right_sep = {
            str = " ",
            hl = function()
              return {
                bg = require("feline.providers.vi_mode").get_mode_color(),
              }
            end,
          },
          enabled = function()
            return plugin_name() == ""
          end,
        },
      },
    }, --}}}
    inactive = {
      {
        {
          provider = plugin_name,
          hl = {
            fg = palette.grey2[1],
            bg = "bg",
          },
          left_sep = {
            str = " ",
          },
        },
        {
          provider = {
            name = "file_info",
            opts = {
              file_modified_icon = "[+]",
              file_readonly_icon = "[-]",
              -- type = "unique",
            },
          },
          icon = "",
          hl = {
            fg = palette.grey2[1],
            bg = "bg",
          },
          left_sep = {
            str = " ",
          },
          enabled = function()
            return plugin_name() == ""
          end,
        },
        {
          enabled = function()
            return not lsp.diagnostics_exist()
          end,
          right_sep = { str = " ", always_visible = true },
        },
        { --{{{
          provider = "diagnostic_errors",
          hl = {
            fg = "red",
          },
        },
        {
          provider = "diagnostic_warnings",
          hl = {
            fg = "yellow",
          },
        },
        {
          provider = "diagnostic_hints",
          hl = {
            fg = "green",
          },
        },
        {
          provider = "diagnostic_info",
          hl = {
            fg = "blue",
          },
        },
        {
          enabled = function()
            return lsp.diagnostics_exist()
          end,
          right_sep = { str = " ", always_visible = true },
          hl = {
            bg = "red",
          },
        }, --}}}
      },
      {
        {
          provider = {
            name = "file_type",
            opts = {
              filetype_icon = true,
              case = "lowercase",
            },
          },
          hl = {
            fg = palette.grey2[1],
          },
          right_sep = {
            str = " ",
          },
          enabled = function()
            return plugin_name() == ""
          end,
        },
      },
    },
  },
  custom_providers = {
    lsp_server_name = function()
      local msg = ""
      local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
      local clients = vim.lsp.get_active_clients()
      if next(clients) == nil then
        return msg
      end
      for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
          msg = msg .. " " .. client.name
        end
      end
      return msg .. " "
    end,
  },
  theme = { --{{{
    bg = palette.bg_statusline1[1],
    fg = palette.fg1[1],
    green = palette.green[1],
    blue = palette.blue[1],
    red = palette.red[1],
    yellow = palette.yellow[1],
  }, --}}}
  -- vi_mode_colors = { --{{{
  --   ["N"] = palette.grey2[1],
  --   ["OP"] = palette.grey2[1],
  --   ["I"] = palette.bg_green[1],
  --   ["V"] = palette.bg_red[1],
  --   ["VL"] = palette.bg_red[1],
  --   ["VB"] = palette.bg_red[1],
  --   ["S"] = palette.orange[1],
  --   ["SL"] = palette.orange[1],
  --   ["SB"] = palette.orange[1],
  --   ["R"] = palette.bg_yellow[1],
  --   ["VR"] = palette.bg_yellow[1],
  --   ["E"] = palette.aqua[1],
  --   ["M"] = palette.aqua[1],
  --   ["C?"] = palette.aqua[1],
  --   ["C"] = palette.blue[1],
  --   ["EX"] = palette.blue[1],
  --   ["SH"] = palette.purple[1],
  --   ["T"] = palette.purple[1],
  --   ["NO"] = palette.grey2[1],
  -- }, --}}}
  vi_mode_colors = { --{{{
    ["NORMAL"] = palette.grey2[1],
    ["O-PENDING"] = palette.grey2[1],
    ["INSERT"] = palette.bg_green[1],
    ["VISUAL"] = palette.bg_red[1],
    ["V-LINE"] = palette.bg_red[1],
    ["V-BLOCK"] = palette.bg_red[1],
    ["SELECT"] = palette.orange[1],
    ["S-LINE"] = palette.orange[1],
    ["S-BLOCK"] = palette.orange[1],
    ["REPLACE"] = palette.bg_yellow[1],
    ["V-REPLACE"] = palette.bg_yellow[1],
    ["ENTER"] = palette.aqua[1],
    ["MORE"] = palette.aqua[1],
    ["CONFIRM"] = palette.aqua[1],
    ["COMMAND"] = palette.blue[1],
    ["EX"] = palette.blue[1],
    ["SHELL"] = palette.purple[1],
    ["TERMINAL"] = palette.purple[1],
    ["NONE"] = palette.grey2[1],
  }, --}}}
  force_inactive = { --{{{
    -- filetypes = {
    --   "^NvimTree$",
    --   "^packer$",
    --   "^startify$",
    --   "^fugitive$",
    --   "^fugitiveblame$",
    --   "^qf$",
    --   "^help$",
    -- },
    -- buftypes = {
    --   "^terminal$",
    --   "^nofile$",
    -- },
  }, --}}}
})

-- require("feline").winbar.setup({
--   components = {
--     active = {
--       { --{{{
--         {
--           provider = plugin_name,
--           hl = {
--             fg = "fg",
--             bg = "bg",
--           },
--           left_sep = {
--             str = " ",
--           },
--         },
--         {
--           provider = {
--             name = "file_info",
--             opts = {
--               file_modified_icon = "[+]",
--               file_readonly_icon = "[-]",
--               -- type = "unique",
--             },
--           },
--           -- icon = "",
--           hl = {
--             fg = "fg",
--             bg = "bg",
--           },
--           left_sep = {
--             str = " ",
--           },
--           enabled = function()
--             return plugin_name() == ""
--           end,
--         },
--         {
--           enabled = function()
--             return not lsp.diagnostics_exist()
--           end,
--           right_sep = { str = " ", always_visible = true },
--         },
--         { --{{{
--           provider = "diagnostic_errors",
--           hl = {
--             fg = "red",
--           },
--         },
--         {
--           provider = "diagnostic_warnings",
--           hl = {
--             fg = "yellow",
--           },
--         },
--         {
--           provider = "diagnostic_hints",
--           hl = {
--             fg = "green",
--           },
--         },
--         {
--           provider = "diagnostic_info",
--           hl = {
--             fg = "blue",
--           },
--         },
--         {
--           enabled = function()
--             return lsp.diagnostics_exist()
--           end,
--           right_sep = { str = " ", always_visible = true },
--           hl = {
--             bg = "red",
--           },
--         }, --}}}
--         {
--           hl = {
--             bg = palette.bg0[1],
--           },
--         },
--       }, --}}}
--     },
--     inactive = {
--       { --{{{
--         {
--           provider = plugin_name,
--           hl = {
--             fg = palette.grey2[1],
--             bg = "bg",
--           },
--           left_sep = {
--             str = " ",
--           },
--         },
--         {
--           provider = {
--             name = "file_info",
--             opts = {
--               file_modified_icon = "[+]",
--               file_readonly_icon = "[-]",
--               type = "unique",
--             },
--           },
--           -- icon = "",
--           hl = {
--             fg = palette.grey2[1],
--             bg = "bg",
--           },
--           left_sep = {
--             str = " ",
--           },
--           enabled = function()
--             return plugin_name() == ""
--           end,
--         },
--         {
--           enabled = function()
--             return not lsp.diagnostics_exist()
--           end,
--           right_sep = { str = " ", always_visible = true },
--         },
--         { --{{{
--           provider = "diagnostic_errors",
--           hl = {
--             fg = "red",
--           },
--         },
--         {
--           provider = "diagnostic_warnings",
--           hl = {
--             fg = "yellow",
--           },
--         },
--         {
--           provider = "diagnostic_hints",
--           hl = {
--             fg = "green",
--           },
--         },
--         {
--           provider = "diagnostic_info",
--           hl = {
--             fg = "blue",
--           },
--         },
--         {
--           enabled = function()
--             return lsp.diagnostics_exist()
--           end,
--           right_sep = { str = " ", always_visible = true },
--         }, --}}}
--         {
--           hl = {
--             bg = palette.bg0[1],
--           },
--         },
--       }, --}}}
--     },
--   },
-- })

-- vim: foldmethod=marker
