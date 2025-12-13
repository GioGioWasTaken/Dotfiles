-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true
vim.o.relativenumber = true

-- Disable mouse mode
vim.o.mouse = ""

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

vim.opt.clipboard = "unnamedplus"

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- Concealer for Neorg
vim.o.conceallevel = 2

-- Set <space> as the leader key
--  NOTE: Must be included before plugins are required (otherwise wrong leader will be used)

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.splitright = true
vim.o.splitbelow = true

-- local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
-- vim.api.nvim_create_autocmd("TextYankPost", {
-- 	callback = function()
-- 		vim.highlight.on_yank()
-- 	end,
-- 	group = highlight_group,
-- 	pattern = "*",
-- })
--
--
-- -- load templates
-- vim.api.nvim_create_autocmd("bufnewfile", {
-- 		pattern = "*.tex",
-- 		command = "0r ~/.config/nvim/templates/default_template.tex",
-- })
--
-- vim.api.nvim_create_autocmd("bufnewfile", {
-- 		pattern = { "exploit.py", "solution.py" },
-- 		command = "0r ~/.config/nvim/templates/exploit.py",
-- })
--
-- vim.api.nvim_create_autocmd("bufnewfile", {
-- 		pattern = { "ret2libc.py" },
-- 		command = "0r ~/.config/nvim/templates/ret2libc.py",
-- })
--
-- vim.api.nvim_create_autocmd("bufnewfile", {
-- 		pattern = { "exploit.md", "solution.md" },
-- 		command = "0r ~/.config/nvim/templates/exploit.md",
-- })
--
-- vim.api.nvim_create_autocmd("bufnewfile", {
-- 		pattern = { "_index.md" },
-- 		command = "0r ~/.config/nvim/templates/_index.md",
-- })
--
-- vim.api.nvim_create_autocmd("bufnewfile", {
-- 		pattern = { "dockerfile" },
-- 		command = "0r ~/.config/nvim/templates/dockerfile",
-- })
--
-- -- automatically clean up auxiliary files when saving a .tex file
-- vim.api.nvim_create_autocmd("bufwritepost", {
-- 		pattern = "*.tex",
-- 		command = "vimtexclean",
-- })
--
