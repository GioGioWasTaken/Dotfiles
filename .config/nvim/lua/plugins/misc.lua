-- Enable Comment.nvim
require('Comment').setup()

-- I don't use git within neovim, so for now irrelevant.
-- require('git-worktree').setup()
-- Go
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require('go.format').goimport()
  end,
  group = format_sync_grp,
})
require('go').setup()

-- LOAD TEMPLATES
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*.tex",
  command = "0r ~/.config/nvim/templates/default_template.tex",
})

vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = { "exploit.py", "solution.py" },
  command = "0r ~/.config/nvim/templates/exploit.py",
})

vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = { "ret2libc.py" },
  command = "0r ~/.config/nvim/templates/ret2libc.py",
})

vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = { "exploit.md", "solution.md" },
  command = "0r ~/.config/nvim/templates/exploit.md",
})


vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = { "_index.md" },
  command = "0r ~/.config/nvim/templates/_index.md",
})

vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = { "dockerfile" },
  command = "0r ~/.config/nvim/templates/dockerfile",
})

-- Automatically clean up auxiliary files when saving a .tex file
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.tex",
  command = "VimtexClean",
})
