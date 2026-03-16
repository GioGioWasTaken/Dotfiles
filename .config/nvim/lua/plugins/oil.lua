local oil = require("oil")
return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		columns = { "icon" },
		keymaps = {
			["<C-h>"] = false,
			["<M-h>"] = "actions.select_split",
		},
		view_options = {
			show_hidden = true,
		},
	},
	keys = {
		{
			"-",
			"<CMD>Oil<CR>",
			desc = "Open parent directory",
		},
		{
			"<space>-",
			function()
				require("oil").toggle_float()
			end,
			desc = "Open parent directory in floating window",
		},
	},

}
