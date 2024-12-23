local harpoon = require("harpoon")

harpoon:setup({})

vim.keymap.set("n", "<leader>m", function() harpoon:list():add() end)
vim.keymap.set("n", "R", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

-- Pick items with keyboard shortcuts

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end) -- High
vim.keymap.set("n", "<C-m>", function() harpoon:list():select(2) end) -- Middle
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(3) end) -- Low

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<leader>sh", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })

