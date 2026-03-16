return {
  {
    "stevearc/conform.nvim",

    event = { "BufWritePre" }, -- loads when formatting is relevant

    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        rust = { "rustfmt" },
        go = { "gofmt" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        java = { "google-java-format" },
        sh = { "shfmt" },
        bash = { "shfmt" },
        html = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        tex = { "latexindent" },
      },

      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },

    keys = {
      {
        "<leader>f",
        function()
          require("conform").format({
            async = true,
            lsp_fallback = true,
          })
        end,
        mode = { "n", "v" },
        desc = "Format buffer or selection",
      },
    },
  },
}
