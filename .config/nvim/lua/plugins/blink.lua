return {
  {
    "saghen/blink.cmp",
    lazy = false,
    version = "v1.*",

    dependencies = {
      "rafamadriz/friendly-snippets",
    },

    opts = {
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },

      sources = {
        default = { "lsp", "path", "buffer", "snippets" },
        providers = {
          snippets = {
            name = "snippets",
            module = "blink.cmp.sources.snippets",
            opts = {
              friendly_snippets = true,
              search_paths = { vim.fn.stdpath("config") .. "/snippets" },
            },
            min_keyword_length = 2,
            score_offset = 4,
          },

          lsp = {
            min_keyword_length = 3,
            score_offset = 3,
          },

          path = {
            min_keyword_length = 3,
            score_offset = 2,
          },

          buffer = {
            min_keyword_length = 5,
            score_offset = 1,
          },
        },
      },

      keymap = {
        preset = "default",

        ["<A-1>"] = { function(cmp) cmp.accept({ index = 1 }) end },
        ["<A-2>"] = { function(cmp) cmp.accept({ index = 2 }) end },
        ["<A-3>"] = { function(cmp) cmp.accept({ index = 3 }) end },
        ["<A-4>"] = { function(cmp) cmp.accept({ index = 4 }) end },
        ["<A-5>"] = { function(cmp) cmp.accept({ index = 5 }) end },
        ["<A-6>"] = { function(cmp) cmp.accept({ index = 6 }) end },
        ["<A-7>"] = { function(cmp) cmp.accept({ index = 7 }) end },
        ["<A-8>"] = { function(cmp) cmp.accept({ index = 8 }) end },
        ["<A-9>"] = { function(cmp) cmp.accept({ index = 9 }) end },

        ["<CR>"] = { "accept", "fallback" },
        ["<A-k>"] = { "select_prev", "fallback" },
        ["<A-j>"] = { "select_next", "fallback" },
        ["<C-d>"] = { "show", "show_documentation", "hide_documentation" },
      },

      completion = {
        menu = {
          draw = {
            columns = {
              { "item_idx" },
              { "kind_icon" },
              { "label",    "label_description", gap = 1 },
            },
            components = {
              item_idx = {
                text = function(ctx)
                  return tostring(ctx.idx)
                end,
                highlight = "BlinkCmpItemIdx",
              },
            },
          },
        },
      },
    },
  },
}
