require("obsidian").setup({
  workspaces = {
    {
      name = "Notes",
      path = "$PROGRAMMING_DIR/Brain/",
    },
  },



-- Optional, customize how note file names are generated given the ID, target directory, and title.
  ---@param spec { id: string, dir: obsidian.Path, title: string|? }
  ---@return string|obsidian.Path The full path to the new note.
  note_path_func = function(spec)
    -- This is equivalent to the default behavior.
    local title = spec.title or spec.id
    local path = spec.dir / title
    return path:with_suffix(".md")
  end,


  ---@param url string
  follow_url_func = function(url)
    -- Open the URL in the default web browser.
    -- vim.fn.jobstart({"xdg-open", url})  -- linux
    vim.ui.open(url) -- need Neovim 0.10.0+
  end
})
