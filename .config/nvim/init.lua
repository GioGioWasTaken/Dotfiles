require('plugins.lazy')
require('plugins.misc')
require('options')
require('misc')
require('keybindings')
require('plugins.lualine')
require('plugins.tele')
require('plugins.treesitter')
require('plugins.lsp')
require('plugins.trouble')
require('plugins.zenmode')
require('plugins.harpoon')
require('plugins.oil')
require('plugins.vimtex')
require('plugins.obsidian')
require("plugins.surround")



--require('plugins.codesnap')
-- vim: ts=8 sts=2 sw=2 et

vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*.tex",
  command = "0r ~/.config/nvim/templates/default_template.tex",
})

vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = { "exploit.py", "solution.py" },
  command = "0r ~/.config/nvim/templates/exploit.py",
})


vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = { "exploit.md", "solution.md" },
  command = "0r ~/.config/nvim/templates/exploit.md",
})


vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = { "_index.md"},
  command = "0r ~/.config/nvim/templates/_index.md",
})


-- Automatically clean up auxiliary files when saving a .tex file
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.tex",
    command = "VimtexClean",
})
