require('conform').setup({
  -- Define formatters for each filetype
  formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'black' },
    javascript = { 'prettier' },
    typescript = { 'prettier' },
    javascriptreact = { 'prettier' },
    typescriptreact = { 'prettier' },
    rust = { 'rustfmt' },
    go = { 'gofmt' },
    c = { 'clang_format' },
    cpp = { 'clang_format' },
    java = { 'google-java-format' },
    sh = { 'shfmt' },
    bash = { 'shfmt' },
    html = { 'prettier' },
    css = { 'prettier' },
    json = { 'prettier' },
    yaml = { 'prettier' },
    markdown = { 'prettier' },
    tex = { 'latexindent' },
  },
  
  -- Format on save (automatic)
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true, -- Use LSP formatting if conform formatter not available
  },
})

-- Manual format keybinding (in addition to auto format on save)
vim.keymap.set({ 'n', 'v' }, '<leader>f', function()
  require('conform').format({ 
    async = true, 
    lsp_fallback = true 
  })
end, { desc = '[F]ormat buffer or range' })
