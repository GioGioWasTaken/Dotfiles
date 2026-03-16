return {
  ---------------------------------------------------------------------------
  -- Mason (LSP installer)
  ---------------------------------------------------------------------------
  {
    "williamboman/mason.nvim",
    opts = {},
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "clangd",
        "rust_analyzer",
        "pyright",
        "lua_ls",
        "gopls",
        "bashls",
        "jdtls",
        "ltex",
        "texlab",
        "marksman",
        "html",
        "ts_ls",
      },
      automatic_installation = true,
    },
  },

  ---------------------------------------------------------------------------
  -- LSP Configuration
  ---------------------------------------------------------------------------
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp",
      "nvim-telescope/telescope.nvim",
    },

    config = function()
      -----------------------------------------------------------------------
      -- Global diagnostic keymaps
      -----------------------------------------------------------------------
      vim.keymap.set(
        "n",
        "<leader>e",
        vim.diagnostic.open_float,
        { desc = "Open diagnostic float" }
      )

      vim.keymap.set(
        "n",
        "<leader>q",
        vim.diagnostic.setloclist,
        { desc = "Set diagnostic loclist" }
      )

      -----------------------------------------------------------------------
      -- on_attach (buffer-local LSP keymaps)
      -----------------------------------------------------------------------
      local on_attach = function(_, bufnr)
        local telescope = require("telescope.builtin")

        vim.keymap.set("n", "gd", telescope.lsp_definitions, {
          desc = "LSP: Go to Definition",
          remap = true,
          buffer = bufnr,
        })

        vim.keymap.set("n", "gr", telescope.lsp_references, {
          desc = "LSP: Go to References",
          remap = true,
          buffer = bufnr,
        })

        vim.keymap.set("n", "gI", vim.lsp.buf.implementation, {
          desc = "LSP: Go to Implementation",
          buffer = bufnr,
        })

        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, {
          desc = "LSP: Type Definition",
          buffer = bufnr,
        })

        vim.keymap.set("n", "<leader>ds", telescope.lsp_document_symbols, {
          desc = "LSP: Document Symbols",
          buffer = bufnr,
        })

        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {
          desc = "LSP: Rename",
          buffer = bufnr,
        })

        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {
          desc = "LSP: Code Action",
          buffer = bufnr,
        })

        vim.keymap.set("n", "K", vim.lsp.buf.hover, {
          desc = "LSP: Hover Documentation",
          buffer = bufnr,
        })
      end

      -----------------------------------------------------------------------
      -- Capabilities from blink.cmp
      -----------------------------------------------------------------------
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -----------------------------------------------------------------------
      -- Server configurations
      -----------------------------------------------------------------------
      local servers = {
        clangd = {},
        rust_analyzer = {},
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

        gopls = {},
        bashls = {},
        jdtls = {},

        ltex = {
          filetypes = { "tex", "bib", "plaintex" },
        },

        texlab = {},
        marksman = {},
        html = {},
        ts_ls = {},
      }

      -----------------------------------------------------------------------
      -- Setup servers
      -----------------------------------------------------------------------
      for server, config in pairs(servers) do
        config.on_attach = on_attach
        config.capabilities = capabilities
        require("lspconfig")[server].setup(config)
      end
    end,
  },
}
