-- Diagnostic keymaps (available globally, not just in LSP buffers)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Set diagnostic loclist" })

-- This function runs when an LSP attaches to a buffer
local on_attach = function(_, bufnr)
	local nmap = function(keys, func, desc)
		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
	end

	-- Navigation
	nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
	nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
	nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

	-- Actions
	nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
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
