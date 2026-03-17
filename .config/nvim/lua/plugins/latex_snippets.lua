return {
  "iurimateus/luasnip-latex-snippets.nvim",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "lervag/vimtex", -- optional if using treesitter
  },
  config = function()
    local ls = require("luasnip")
    local utils = require("luasnip-latex-snippets.util.utils")
    local not_math = utils.not_math() -- pass true if using Treesitter(I use VimTeX)
    local is_math = utils.is_math()

    require("luasnip-latex-snippets").setup()

    require("luasnip").config.setup({
      enable_autosnippets = true,
    })

    local boxSnippet = ls.parser.parse_snippet(
      { trig = "box", name = "Boxed Text", condition = not_math },
      "\\boxed{\\text{${1:${TM_SELECTED_TEXT}}}}$0"
    )

    local greek_letters = {
      -- lowercase
      { "alpha",   "\\alpha" },
      { "beta",    "\\beta" },
      { "gamma",   "\\gamma" },
      { "delta",   "\\delta" },
      { "epsilon", "\\epsilon" },
      { "zeta",    "\\zeta" },
      { "eta",     "\\eta" },
      { "theta",   "\\theta" },
      { "iota",    "\\iota" },
      { "kappa",   "\\kappa" },
      { "lambda",  "\\lambda" },
      { "mu",      "\\mu" },
      { "nu",      "\\nu" },
      { "xi",      "\\xi" },
      { "pi",      "\\pi" },
      { "rho",     "\\rho" },
      { "sigma",   "\\sigma" },
      { "tau",     "\\tau" },
      { "upsilon", "\\upsilon" },
      { "phi",     "\\phi" },
      { "chi",     "\\chi" },
      { "psi",     "\\psi" },
      { "omega",   "\\omega" },
      -- uppercase
      { "Gamma",   "\\Gamma" },
      { "Delta",   "\\Delta" },
      { "Theta",   "\\Theta" },
      { "Lambda",  "\\Lambda" },
      { "Xi",      "\\Xi" },
      { "Pi",      "\\Pi" },
      { "Sigma",   "\\Sigma" },
      { "Upsilon", "\\Upsilon" },
      { "Phi",     "\\Phi" },
      { "Psi",     "\\Psi" },
      { "Omega",   "\\Omega" },
    }

    local greek_letter_snips = {}

    for _, pair in ipairs(greek_letters) do
      local trig, expansion = pair[1], pair[2]
      table.insert(greek_letter_snips, ls.parser.parse_snippet(
        { trig = "_" .. trig, name = trig, condition = is_math, priority = 0 },
        expansion .. "$0"
      ))
    end


    -- Add my own snippets
    ls.add_snippets("tex", { boxSnippet })
    ls.add_snippets("tex", greek_letter_snips, { type = "autosnippets" })



    -- These keybindings should not exist if we are not on a tex file.

    -- Optimized inkscape workflow for latex figures without hellish tikz
    vim.keymap.set('i', '<C-f>', function()
      local line = vim.api.nvim_get_current_line()
      local root = vim.b.vimtex and vim.b.vimtex.root or vim.fn.expand('%:p:h')
      vim.cmd('silent exec "normal! \\"_dd"')
      vim.fn.system(
        string.format(
          'uv run inkscape-figures create "%s" "%s/figures/"',
          line,
          root
        )
      )
      vim.cmd('stopinsert')
      vim.cmd('write')
    end, { noremap = true, silent = true })

    vim.api.nvim_create_user_command('Inkedit', function()
      local root = vim.b.vimtex and vim.b.vimtex.root or vim.fn.expand('%:p:h')
      vim.fn.jobstart(
        string.format('uv run inkscape-figures edit "%s/figures/"', root),
        { detach = true }
      )
      vim.cmd('redraw!')
    end, {})
  end,
}
