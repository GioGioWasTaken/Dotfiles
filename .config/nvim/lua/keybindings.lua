-- Keymaps for better default experiencekeybin
-- See `:help vim.keymap.set()`
--
-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- remap start and end of line
vim.api.nvim_set_keymap("n", "H", "^", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "L", "$", { noremap = true, silent = true })

-- Visual mode
vim.api.nvim_set_keymap("v", "H", "^", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "L", "$", { noremap = true, silent = true })

-- Operator-pending mode
vim.api.nvim_set_keymap("o", "H", "^", { noremap = true, silent = true })
vim.api.nvim_set_keymap("o", "L", "$", { noremap = true, silent = true })

-- Other keymaps

vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })

-- Attempt to include both V and vv in this? weird.
vim.api.nvim_set_keymap("x", ">", ">gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<", "<gv", { noremap = true, silent = true })

-- Visual mode modifications
--vim.api.nvim_set_keymap("n", "vv", "V", { noremap = true, silent = true })
--vim.api.nvim_set_keymap("n", "V", "v$", { noremap = true, silent = true })
-- NOTE: this is a good remap, but currently i disabled it in interest of being as close to vanilla vim as possible

-- Enumerate automatically selected lines under cursor
vim.api.nvim_set_keymap(
	"v",
	"<leader>e",
	[[:s/^/\=line('.') - line("'<") + 1 . '. '/<CR>]],
	{ noremap = true, silent = true }
)

-- Use qq as a way to go to normal mode from all modes.
-- vim.api.nvim_set_keymap("i", "qq", "<Esc>", { noremap = false })
-- vim.api.nvim_set_keymap("v", "qq", "<Esc>", { noremap = false })
-- vim.api.nvim_set_keymap("t", "qq", "<Esc>", { noremap = false })
--
-- -- Disable 'q' and 'Q' keys
-- vim.api.nvim_set_keymap("n", "q", "<NOP>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "Q", "<NOP>", { noremap = true })
--
-- -- Remap macro recording to 'm'
-- vim.api.nvim_set_keymap("n", "m", "q", { noremap = true })
-- -- replay last macro
-- vim.api.nvim_set_keymap("n", "M", "@@", { noremap = true })

-- switch from qq to jk so that q stays idiomatic to normal vim
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = false })
vim.api.nvim_set_keymap("i", "kj", "<Esc>", { noremap = false })

-- newline without entering normal mode
vim.api.nvim_set_keymap("n", "<leader>o", "o<Esc>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>O", "O<Esc>", { noremap = true })

-- Void register for one character deletions should not affect clipboard
vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", '""', 'ysiw"', { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "))", "ysiw)", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "]]", "ysiw]", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "''", "ysiw'", { noremap = false, silent = true })

vim.keymap.set("n", "<leader>p", "o<Esc>p")

-- Thanks ThePrimeAgen!!

--  No terminal needed.
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- replace word on cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- move text with J and K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

vim.keymap.set("n", "J", "msJ`z")
vim.keymap.set("n", "<C-D", "<C-D>zz")
vim.keymap.set("n", "<C-U>", "<C-U>zz")

-- void register magic
vim.keymap.set("v", "D", '"_d')
-- this same behaviour for P already exists in NeoVim.
-- Just paste with P in visual mode to not replace the unnamed register (see :help v_P).

-- Fix markdown links easily
vim.keymap.set("n", "<leader>fl", ":w<CR>:!python $SCRIPTS/restyle_links.py<CR>", { silent = true })

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- ThePrimeAgen END

-- twilight
vim.api.nvim_set_keymap("n", "tw", ":Twilight<enter>", { noremap = false })

-- buffers
vim.api.nvim_set_keymap("n", "tG", ":blast<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "tgg", ":bfirst<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "th", ":bprev<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "tl", ":bnext<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "td", ":bdelete<enter>", { noremap = false })

vim.api.nvim_set_keymap("n", "TT", ":TransparentToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "ss", ":noh<CR>", { noremap = true })

vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-N>", { silent = true })
-- map this to escape and qq to escape above, for simplicity.

-- find current file in markdown
-- vim.api.nvim_set_keymap(
-- 	"n",
-- 	"gf",
-- 	'yiw:lua require("telescope.builtin").find_files({search_dirs = {"."}, prompt_title = "Find Markdown File"})<CR><C-r>"',
-- 	{ noremap = true, silent = true }
-- )

-- cd to current buffer
vim.api.nvim_set_keymap("n", "<Space>cd", ":cd %:p:h<CR>:pwd<CR>", { noremap = true, silent = true })

-- Noice
vim.api.nvim_set_keymap("n", "<C-y>", ":Noice dismiss<CR>", { noremap = true })

vim.api.nvim_create_user_command("GetFilename", function()
	vim.fn.setreg("+", vim.fn.expand("%:p"))
end, {})

-- AUTOCOMMANDS

-- this should disable auto comment on newline when on a comment line
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	command = "set formatoptions-=cro",
})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	command = "setlocal formatoptions-=cro",
})

-- stole from nvim-surround guy

local map = vim.keymap.set

-- Smart delete lines; don't clutter clipboard with whitespace lines
map("n", "dd", function()
	local line = vim.api.nvim_get_current_line()
	if line:match("^%s*$") then
		return '"_dd'
	end
	return "dd"
end, { expr = true, silent = true })

-- Open todo list
map("n", "<Leader>t", function()
	vim.cmd.edit("~/Desktop/Linux-Machine/todo.md")
end, { silent = true })
