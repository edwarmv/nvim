return {
  "gbprod/substitute.nvim",
  opts = {},
  keys = {
    {
      "cx",
      function()
        require("substitute.exchange").operator()
      end,
    },
    {
      "cxx",
      function()
        require("substitute.exchange").line()
      end,
    },
    {
      "X",
      function()
        require("substitute.exchange").visual()
      end,
      mode = "x",
    },
    {
      "cxc",
      function()
        require("substitute.exchange").cancel()
      end,
    },
  },
}
