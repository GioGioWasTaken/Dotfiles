return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "iurimateus/luasnip-latex-snippets.nvim",
    "lervag/vimtex",
  },
  config = function()
    require("luasnip").config.setup({
      enable_autosnippets = true,
    })
    require("snippets.friendly")
    require("snippets.latex")
  end,
}
