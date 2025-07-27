local noice=require("noice")
noice.setup({

routes = {
  {

    filter = {
      event = "msg_show",
      any = {
        { find = "%d+L, %d+B" },
        { find = "; after #%d+" },
        { find = "; before #%d+" },
      },
    },
    view = "mini",
  },

  -- TS-Action spams a lot
  {
    filter = {
      event = "notify",
      kind = "info",
      any = {
        { find = "No node found at cursor" },
      },
    },
    opts = { skip = true },
  },

  -- Skip validation from all LSPS.
  {
    filter = {
      event = "lsp",
      kind = "progress",
    },
    opts = { skip = true },
  },
},
presets = {
  bottom_search = true,
  command_palette = true,
  long_message_to_split = true,
  inc_rename = true,
  lsp_doc_border = true,
},
})
