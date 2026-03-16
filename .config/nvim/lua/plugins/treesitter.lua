return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    opts = {
      ensure_installed = {
        "go",
        "lua",
        "python",
        "rust",
        "typescript",
        "regex",
        "bash",
        "markdown",
        "markdown_inline",
        "kdl",
        "sql",
        "terraform",
        "html",
        "css",
        "javascript",
        "yaml",
        "json",
        "toml",
        "java",
        "c",
        "cpp",
      },

      highlight = {
        enable = true,
        disable = { "latex", "tex" },
      },

      indent = {
        enable = true,
        disable = { "latex", "tex" },
      },

      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["aa"] = "@parameter.outer",
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ic"] = "@conditional.inner",
            ["ac"] = "@conditional.outer",
            ["il"] = "@loop.inner",
            ["al"] = "@loop.outer",
            ["at"] = "@comment.outer",
          },
          disable = { "latex", "tex" },
        },

        move = {
          enable = true,
          set_jumps = true,
          disable = { "latex", "tex" },
          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]]"] = "@class.outer",
          },
          goto_next_end = {
            ["]F"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[["] = "@class.outer",
          },
          goto_previous_end = {
            ["[F"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
        },
      },
    },
  },
}
