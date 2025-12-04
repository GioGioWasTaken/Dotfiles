-- Diagnostic keymaps (available globally, not just in LSP buffers)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Set diagnostic loclist" })

-- This function runs when an LSP attaches to a buffer
local on_attach = function(_, bufnr)
	-- Navigation
	vim.keymap.set(
		"n",
		"gd",
		require("telescope.builtin").lsp_definitions,
		{ desc = "LSP: [G]oto [D]efinition", remap = true }
	)
	vim.keymap.set(
		"n",
		"gr",
		require("telescope.builtin").lsp_references,
		{ desc = "LSP: [G]oto [R]eferences", remap = true }
	)
	vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "LSP: [G]oto [I]mplementation" })
	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "LSP: Type [D]efinition" })
	vim.keymap.set(
		"n",
		"<leader>ds",
		require("telescope.builtin").lsp_document_symbols,
		{ desc = "LSP: [D]ocument [S]ymbols" }
	)

	-- Actions
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP: [R]e[n]ame" })
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: [C]ode [A]ction" })
	vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP: Hover Documentation" })
end

-- Setup Mason (installs LSPs, formatters, etc.)
require("mason").setup()

-- Define which language servers you want installed and configured
local servers = {
	-- Systems programming
	clangd = {},
	rust_analyzer = {},

	-- Scripting
	pyright = {},
	lua_ls = {
		settings = {
			Lua = {
				runtime = { version = "LuaJIT" },
				diagnostics = { globals = { "vim" } },
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
					checkThirdParty = false,
				},
				telemetry = { enable = false },
			},
		},
	},

	-- Other languages
	gopls = {},
	bashls = {},
	jdtls = {},

	-- Markup/documentation
	ltex = {
		filetypes = { "tex", "bib", "plaintex" }, -- Exclude markdown
	},
	texlab = {},
	marksman = {},
	html = {},

	ts_ls = {},
}

-- Ensure servers are installed via Mason
require("mason-lspconfig").setup({
	ensure_installed = vim.tbl_keys(servers),
	automatic_installation = true,
})

-- Get capabilities from blink.cmp for completion support
local capabilities = require("blink.cmp").get_lsp_capabilities()

-- Setup each server with lspconfig
for server, config in pairs(servers) do
	-- Merge in our on_attach and capabilities
	config.on_attach = on_attach
	config.capabilities = capabilities

	require("lspconfig")[server].setup(config)
end
