require("lspkind").init({
  -- defines how annotations are shown
  -- default: symbol
  -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
  mode = "text",

  -- default symbol map
  -- can be either 'default' (requires nerd-fonts font) or
  -- 'codicons' for codicon preset (requires vscode-codicons font)
  --
  -- default: 'default'
  preset = "codicons",

  -- override preset symbols
  --
  -- default: {}
  -- symbol_map = {
  --   Text = "[text]",
  --   Method = "[method]",
  --   Function = "[function]",
  --   Constructor = "[constructor]",
  --   Field = "[field]",
  --   Variable = "[variable]",
  --   Class = "[class]",
  --   Interface = "[interface]",
  --   Module = "[module]",
  --   Property = "[property]",
  --   Unit = "[unit]",
  --   Value = "[value]",
  --   Enum = "[enum]",
  --   Keyword = "[keyword]",
  --   Snippet = "[snippet]",
  --   Color = "color",
  --   File = "[field]",
  --   Reference = "[reference]",
  --   Folder = "[folder]",
  --   EnumMember = "enum_member",
  --   Constant = "[constant]",
  --   Struct = "[struct]",
  --   Event = "[event]",
  --   Operator = "[operator]",
  --   TypeParameter = "[type_parameter]",
  -- },
  symbol_map = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
  },
  -- symbol_map = {
  --   Text = " ",
  --   Method = " ",
  --   Function = " ",
  --   Constructor = " ",
  --   Field = " ",
  --   Variable = " ",
  --   Class = " ",
  --   Interface = " ",
  --   Module = " ",
  --   Property = " ",
  --   Unit = " ",
  --   Value = " ",
  --   Enum = " ",
  --   Keyword = " ",
  --   Snippet = " ",
  --   Color = " ",
  --   File = " ",
  --   Reference = " ",
  --   Folder = " ",
  --   EnumMember = " ",
  --   Constant = " ",
  --   Struct = " ",
  --   Event = " ",
  --   Operator = " ",
  --   TypeParameter = " ",
  -- },
})
--[[ "suggest.completionItemKindLabels": {
      '  Text';          -- = 1
      '  Function';      -- = 2;
      '  Method';        -- = 3;
      '  Constructor';   -- = 4;
      '  Field';         -- = 5;
      '  Variable';      -- = 6;
      '  Class';         -- = 7;
      '  Interface';     -- = 8;
      '  Module';        -- = 9;
      '  Property';      -- = 10;
      '  Unit';          -- = 11;
      '  Value';         -- = 12;
      '  Enum';          -- = 13;
      '  Keyword';       -- = 14;
      '  Snippet';       -- = 15;
      '  Color';         -- = 16;
      '  File';          -- = 17;
      '  Reference';     -- = 18;
      '  Folder';        -- = 19;
      '  EnumMember';    -- = 20;
      '  Constant';      -- = 21;
      '  Struct';        -- = 22;
      '  Event';         -- = 23;
      '  Operator';      -- = 24;
      '  TypeParameter'; -- = 25;
  }, ]]
