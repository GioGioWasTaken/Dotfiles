return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
      "ThePrimeagen/harpoon",
    },

    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
            preview_width = 0.65,
              size = {
                width = "95%",
                height = "95%",
              },
            },
          },
          mappings = {
            i = {
              ["<C-u>"] = false,
              ["<C-d>"] = false,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["qq"] = actions.close,
            },
          },
        },
        pickers = {
          find_files = {
            theme = "dropdown",
          },
        },
      })

      pcall(telescope.load_extension, "fzf")
      pcall(telescope.load_extension, "harpoon")
    end,

    keys = {
      { "<leader>?", function() require("telescope.builtin").oldfiles() end, desc = "Find recent files" },

      {
        "<leader>/",
        function()
          require("telescope.builtin").current_buffer_fuzzy_find(
            require("telescope.themes").get_dropdown({
              winblend = 10,
              previewer = true,
            })
          )
        end,
        desc = "Fuzzily search in current buffer",
      },

      { "<C-f>", function() require("telescope.builtin").find_files() end, desc = "Find files" },
      { "<leader>sw", function() require("telescope.builtin").grep_string() end, desc = "Search word" },
      { "<leader>sg", function() require("telescope.builtin").live_grep() end, desc = "Live grep" },
      { "<leader>sd", function() require("telescope.builtin").diagnostics() end, desc = "Diagnostics" },
      { "<leader>sb", function() require("telescope.builtin").buffers() end, desc = "Buffers" },

      { "<leader>sm", ":Telescope harpoon marks<CR>", desc = "Harpoon marks" },
      { "<leader>sn", function() require("telescope").extensions.notify.notify() end, desc = "Notifications" },

      { "st", ":TodoTelescope<CR>", desc = "Todo Telescope" },
      {
        "<leader><tab>",
        function() require("telescope.builtin").commands() end,
        desc = "Commands",
      },
    },
  },
}
