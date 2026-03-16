return {
  {
    "folke/trouble.nvim",
    cmd = "Trouble",

    opts = {},

    keys = {
      {
        "<leader>xd",
        "<cmd>Trouble diagnostics<cr>",
        desc = "Trouble: Diagnostics",
      },

      {
        "gR",
        "<cmd>Trouble lsp_references<cr>",
        desc = "Trouble: LSP References",
      },

      -- Uncomment if needed:
      -- { "<leader>xx", "<cmd>Trouble<cr>", desc = "Trouble" },
      -- { "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", desc = "Trouble: Workspace Diagnostics" },
      -- { "<leader>xl", "<cmd>Trouble loclist<cr>", desc = "Trouble: Location List" },
      -- { "<leader>xq", "<cmd>Trouble quickfix<cr>", desc = "Trouble: Quickfix" },
    },

    config = function()
      local signs = {
        Error = " ",
        Warning = " ",
        Hint = " ",
        Information = " ",
      }

      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, {
          text = icon,
          texthl = hl,
          numhl = hl,
        })
      end
    end,
  },
}
