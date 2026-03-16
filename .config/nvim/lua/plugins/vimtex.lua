return {
  {
    "lervag/vimtex",
    ft = { "tex", "plaintex", "bib" },

    init = function()
      vim.g.vimtex_mappings_enabled = 1
      vim.g.vimtex_compiler_method = "latexmk"

      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_view_general_options =
      "--synctex-forward @line:@col:@tex --no-focus"

      vim.g.tex_conceal = "abdmg"
      vim.g.vimtex_view_automatic = 0

      vim.api.nvim_create_autocmd("User", {
        pattern = "VimtexEventQuit",
        command = "VimtexClean",
      })
    end,
  },
}
