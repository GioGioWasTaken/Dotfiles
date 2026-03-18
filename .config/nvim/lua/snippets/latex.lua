require("luasnip-latex-snippets").setup()

local ls = require("luasnip")
local utils = require("luasnip-latex-snippets.util.utils")
local not_math = utils.not_math()
local is_math = utils.is_math()

-- ── Regular snippets ────────────────────────────────────────────────────────

local M = {}

M.regular = {
	ls.parser.parse_snippet(
		{ trig = "box", name = "Boxed Text", condition = not_math },
		"\\boxed{\\text{${1:${TM_SELECTED_TEXT}}}}$0"
	),
}

-- ── Greek letter autosnippets (trigger: _alpha, _beta, …) ───────────────────

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

M.autosnippets = {}
for _, pair in ipairs(greek_letters) do
	local trig, expansion = pair[1], pair[2]
	table.insert(M.autosnippets, ls.snippet(
		{
			trig = "_" .. trig,
			trigEngine = "pattern",
			wordTrig = false, -- allow trigger mid-word / after other chars
			name = trig,
			condition = is_math,
			snippetType = "autosnippet",
		},
		ls.text_node("_" .. expansion) -- e.g. "_\\epsilon"
	))
end

-- ── Register ─────────────────────────────────────────────────────────────────

ls.add_snippets("tex", M.regular)
ls.add_snippets("tex", M.autosnippets, { type = "autosnippets" })

-- ── Inkscape figure keymaps (tex-only) ───────────────────────────────────────

vim.api.nvim_create_autocmd("FileType", {
	pattern = "tex",
	callback = function()
		vim.keymap.set("i", "<C-f>", function()
			local line = vim.api.nvim_get_current_line()
			local root = vim.b.vimtex and vim.b.vimtex.root or vim.fn.expand("%:p:h")
			vim.cmd('silent exec "normal! \\"_dd"')
			vim.fn.system(string.format(
				'uv run inkscape-figures create "%s" "%s/figures/"', line, root
			))
			vim.cmd("stopinsert")
			vim.cmd("write")
		end, { noremap = true, silent = true, buffer = true })

		vim.api.nvim_create_user_command("Inkedit", function()
			local root = vim.b.vimtex and vim.b.vimtex.root or vim.fn.expand("%:p:h")
			vim.fn.jobstart(
				string.format('uv run inkscape-figures edit "%s/figures/"', root),
				{ detach = true }
			)
			vim.cmd("redraw!")
		end, {})
	end,
})

return M
