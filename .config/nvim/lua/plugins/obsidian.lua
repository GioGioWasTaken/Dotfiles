return {
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    ft = "markdown",

    dependencies = {
      "nvim-lua/plenary.nvim",
    },

    opts = {
      workspaces = {
        {
          name = "Notes",
          path = "$PROGRAMMING_DIR/Brain/",
        },
      },


      note_path_func = function(spec)
        -- Default-like behavior
        local title = spec.title or spec.id
        local path = spec.dir / title
        return path:with_suffix(".md")
      end,

      follow_url_func = function(url)
        vim.ui.open(url)                 -- Neovim 0.10+
      end,
      preferred_link_style = "markdown", -- we can make obsidian create links relative from my_brain(the obsidian directory) using the Obsidianlink command, which will then open a fuzzy finder menu. This is not much better the marksman suggestions which come through blink.cmp

    },
  },
}
