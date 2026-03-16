return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2", -- remove if you're using v1

    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },

    opts = {},

    keys = {
      {
        "<leader>m",
        function()
          require("harpoon"):list():add()
        end,
        desc = "Harpoon: Add file",
      },

      {
        "R",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon: Toggle menu",
      },

      {
        "<C-h>",
        function()
          require("harpoon"):list():select(1)
        end,
        desc = "Harpoon: Select 1",
      },

      {
        "<C-m>",
        function()
          require("harpoon"):list():select(2)
        end,
        desc = "Harpoon: Select 2",
      },

      {
        "<C-l>",
        function()
          require("harpoon"):list():select(3)
        end,
        desc = "Harpoon: Select 3",
      },

      {
        "<leader>sh",
        function()
          local harpoon = require("harpoon")
          local conf = require("telescope.config").values

          local function toggle_telescope(harpoon_files)
            local file_paths = {}

            for _, item in ipairs(harpoon_files.items) do
              table.insert(file_paths, item.value)
            end

            require("telescope.pickers")
              .new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                  results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
              })
              :find()
          end

          toggle_telescope(harpoon:list())
        end,
        desc = "Harpoon: Telescope picker",
      },
    },
  },
}
