local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- load templates
vim.api.nvim_create_autocmd("bufnewfile", {
	pattern = "*.tex",
	command = "0r ~/.config/nvim/templates/default_template.tex",
})

vim.api.nvim_create_autocmd("bufnewfile", {
	pattern = { "exploit.py", "solution.py" },
	command = "0r ~/.config/nvim/templates/exploit.py",
})

vim.api.nvim_create_autocmd("bufnewfile", {
	pattern = { "ret2libc.py" },
	command = "0r ~/.config/nvim/templates/ret2libc.py",
})

vim.api.nvim_create_autocmd("bufnewfile", {
	pattern = { "exploit.md", "solution.md" },
	command = "0r ~/.config/nvim/templates/exploit.md",
})

vim.api.nvim_create_autocmd("bufnewfile", {
	pattern = { "_index.md" },
	command = "0r ~/.config/nvim/templates/_index.md",
})

vim.api.nvim_create_autocmd("bufnewfile", {
	pattern = { "dockerfile" },
	command = "0r ~/.config/nvim/templates/dockerfile",
})

-- automatically clean up auxiliary files when saving a .tex file
vim.api.nvim_create_autocmd("bufwritepost", {
	pattern = "*.tex",
	command = "vimtexclean",
})
