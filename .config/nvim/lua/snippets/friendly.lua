-- Loads VSCode-style snippets from friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- Optional: load only specific filetypes to avoid bloat
-- require("luasnip.loaders.from_vscode").lazy_load({ include = { "tex", "python", "lua" } })
