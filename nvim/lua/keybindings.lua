-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
--
-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- remap start and end of line
vim.api.nvim_set_keymap('n', 'H', '^', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'L', '$', { noremap = true, silent = true })

-- Visual mode
vim.api.nvim_set_keymap('v', 'H', '^', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'L', '$', { noremap = true, silent = true })

-- Operator-pending mode
vim.api.nvim_set_keymap('o', 'H', '^', { noremap = true, silent = true })
vim.api.nvim_set_keymap('o', 'L', '$', { noremap = true, silent = true })


-- Other keymaps


vim.api.nvim_set_keymap('n', 'gf', [[:silent! execute 'grep -r --include="*.*" "^" ./' .. vim.fn.getreg('0') .. ' | grep -v ":$"' | execute 'edit' vim.fn.fnamemodify(vim.fn.split(vim.fn.get(grep(vim.fn.escape(vim.fn.getreg('0'), " ")), 0, '')[1], ":")[1], ':p')<CR>]], { noremap = true, silent = true })

-- Use qq as a way to go to normal mode from all modes.
vim.api.nvim_set_keymap("i", "qq", "<Esc>", {noremap=false})
vim.api.nvim_set_keymap("v", "qq", "<Esc>", {noremap=false})
vim.api.nvim_set_keymap("t", "qq", "<Esc>", {noremap=false})

-- Disable 'q' and 'Q' keys
vim.api.nvim_set_keymap("n", "q", "<NOP>", { noremap = true })
vim.api.nvim_set_keymap("n", "Q", "<NOP>", { noremap = true })

-- Remap macro recording to 'm' 
vim.api.nvim_set_keymap("n", "m", "q", { noremap = true })
-- replay last macro
vim.api.nvim_set_keymap("n", "M", "@@", { noremap = true })




-- newline without entering normal mode
vim.api.nvim_set_keymap("n", "<leader>o", "o<Esc>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>O", "O<Esc>", { noremap = true })

-- Void register for one characte deletions
vim.api.nvim_set_keymap('n', 'x', '"_x', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '""', 'ysiw"', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', '))', 'ysiw)', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', "]]", "ysiw]", { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', "''", "ysiw'", { noremap = false, silent = true })

vim.api.nvim_set_keymap("n", "<leader>zz", [[:%s/\/\/\(.*\)/\/\*\1\*\//g<CR>]], { noremap = true, silent = true })


-- Experiment. Might be the best remap ever?



-- Remap 6d to 6j and 6f to 6k in normal and visual mode.
vim.api.nvim_set_keymap('n', '6d', '6j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '6f', '6k', { noremap = true, silent = true })


vim.api.nvim_set_keymap('v', '6d', '6j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '6f', '6k', { noremap = true, silent = true })



-- Remap 7d to 7j and 7f to 7k
vim.api.nvim_set_keymap('n', '7d', '7j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '7f', '7k', { noremap = true, silent = true })

vim.api.nvim_set_keymap('v', '7d', '7j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '7f', '7k', { noremap = true, silent = true })

-- Remap 8d to 8j and 8f to 8k
vim.api.nvim_set_keymap('n', '8d', '8j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '8f', '8k', { noremap = true, silent = true })

vim.api.nvim_set_keymap('v', '8d', '8j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '8f', '8k', { noremap = true, silent = true })


-- Remap 9d to 9j and 9f to 9k
vim.api.nvim_set_keymap('n', '9d', '9j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '9f', '9k', { noremap = true, silent = true })

vim.api.nvim_set_keymap('v', '9d', '9j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '9f', '9k', { noremap = true, silent = true })



      -- Thanks ThePrimeAgen!!



--  No terminal needed.
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })


-- this remap is awesome, and i will use it eventually, but for now I like being forced to learn replacing stuff manually
--  it's a necessary step to improve my find and replace skills.
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- move text with J and K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

vim.keymap.set("n","J","msJ`z")
vim.keymap.set("n","<C-D","<C-D>zz")
vim.keymap.set("n","<C-U>","<C-U>zz")

-- void register magic
vim.keymap.set("v","D","\"_d")
-- this same behaviour for P already exists in NeoVim.
-- Just paste with P in visual mode to not replace the unnamed register (see :help v_P). 


-- twilight
vim.api.nvim_set_keymap("n", "tw", ":Twilight<enter>", {noremap=false})

-- buffers
vim.api.nvim_set_keymap("n", "tG", ":blast<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "tgg", ":bfirst<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "th", ":bprev<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "tl", ":bnext<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "td", ":bdelete<enter>", {noremap=false})

-- files
vim.api.nvim_set_keymap("n", "QQ", ":q!<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "WW", ":w!<enter>", {noremap=false})


vim.api.nvim_set_keymap("n", "TT", ":TransparentToggle<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "ss", ":noh<CR>", {noremap=true})



-- stop highlighting of words (for example by / or ?)
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<C-c>", ":%y<CR>", {noremap=true, silent=true})


-- my terminal shortcuts
-- vim.api.nvim_set_keymap("n", "vv", ":rightbelow vertical terminal<CR>", { noremap = true, silent = true })
-- No longer needed. I use tmux.




vim.api.nvim_set_keymap ('t', '<Esc>', "<C-\\><C-N>",  {silent = true })
-- map this to escape and qq to escape above, for simplicity.


-- Move to the left split
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", { noremap = true, silent = true })

-- Move to the split below
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", { noremap = true, silent = true })

-- Move to the split above
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", { noremap = true, silent = true })

-- Move to the right split
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
-- we have to get rid of the C-l remap, since it interferes with terminal shortcut,
-- but my terminal is always my rightmost window, so it's not an issue.
-- vim.api.nvim_set_keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", { noremap = true, silent = true })


-- find current file in markdown 
vim.api.nvim_set_keymap('n', 'gf', 'yiw:lua require("telescope.builtin").find_files({search_dirs = {"."}, prompt_title = "Find Markdown File"})<CR><C-r>"', { noremap = true, silent = true })

-- hopper
vim.api.nvim_set_keymap("n", "S", ":HopWord<CR>", {noremap=true})


-- cd to current buffer
vim.api.nvim_set_keymap('n', '<Space>cd', ':cd %:p:h<CR>:pwd<CR>', { noremap = true, silent = true })


-- Noice
vim.api.nvim_set_keymap("n", "<C-y>", ":Noice dismiss<CR>", {noremap=true})

-- vim.keymap.set("n", "<leader>ee", "<cmd>GoIfErr<cr>", {silent = true, noremap = true}) -- idk what this does

-- splits

vim.api.nvim_set_keymap("n", "<C-,>", ":vertical resize -10<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<C-.>", ":vertical resize +10<CR>", {noremap=true})
-- Quicker close split
vim.keymap.set("n", "<leader>qq", ":q<CR>", {silent = true, noremap = true})



vim.api.nvim_set_keymap('i', 'df', '<Right>', { noremap = true, silent = true })


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


-- amazing remap:
-- Open todo list
map("n", "<Leader>t", function()
    vim.cmd.edit("~/Desktop/Linux-Machine/todo.md")
end, { silent = true })


