-- Install lazylua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Fixes Notify opacity issues
vim.o.termguicolors = true

require('lazy').setup({
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",

		dependencies = { "nvim-lua/plenary.nvim" }
	},
	{
		"mistricky/codesnap.nvim",

		build = "make",
	},
	{
		'mfussenegger/nvim-jdtls',
		ft = "java",


	},
	'onsails/lspkind.nvim',
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },

		build = function() vim.fn["mkdp#util#install"]() end,
	},
	"preservim/vim-pencil",
	{
		"sourcegraph/sg.nvim",

		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	'folke/zen-mode.nvim',
	'tpope/vim-obsession',
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
	},
	{
		'xiyaowong/nvim-transparent',
		lazy = false,

	},
	{
		'rmagatti/goto-preview',
		config = function()
			require('goto-preview').setup {
				width = 120, -- Width of the floating window
				height = 15, -- Height of the floating window
				border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" }, -- Border characters of the floating window
				default_mappings = true,
				debug = false, -- Print debug information
				opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
				resizing_mappings = false, -- Binds arrow keys to resizing the floating window.
				post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
				references = { -- Configure the telescope UI for slowing the references cycling window.
					telescope = require("telescope.themes").get_dropdown({ hide_preview = false })
				},
				-- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
				focus_on_open = true,            -- Focus the floating window when opening it.
				dismiss_on_move = false,         -- Dismiss the floating window when moving the cursor.
				force_close = true,              -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
				bufhidden = "wipe",              -- the bufhidden option to set on the floating window. See :h bufhidden
				stack_floating_preview_windows = true, -- Whether to nest floating windows
				preview_window_title = { enable = true, position = "left" }, -- Whether
			}
		end
	},

	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	},
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		lazy = false,
		config = function()
			require("todo-comments").setup {}
		end
	},

	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				background_colour = "#000000",
				enabled = false,
			})
		end
	},
	{
		"folke/noice.nvim",
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		}
	},

	'ray-x/go.nvim',
	'ray-x/guihua.lua',
	{

		lazy = false,
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			vim.cmd.colorscheme("catppuccin")
		end,

	},
	{
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	},


	{
		'saghen/blink.cmp',
		lazy = false,  -- handled inside blink. lazy loading actually slows up startup time.
		-- optional: provides snippets for the snippet source
		dependencies = {
			'rafamadriz/friendly-snippets',
			{
				'L3MON4D3/LuaSnip',
				opts = {
					history = true,
					region_check_events = "InsertEnter",
					delete_check_events = "TextChanged,InsertLeave",
				},
			},
		},

		version = 'v1.*',
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = 'mono'
			},

			-- default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, via `opts_extend`
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			keymap = {
				preset = 'default',
				['<A-1>'] = { function(cmp) cmp.accept({ index = 1 }) end },
				['<A-2>'] = { function(cmp) cmp.accept({ index = 2 }) end },
				['<A-3>'] = { function(cmp) cmp.accept({ index = 3 }) end },
				['<A-4>'] = { function(cmp) cmp.accept({ index = 4 }) end },
				['<A-5>'] = { function(cmp) cmp.accept({ index = 5 }) end },
				['<A-6>'] = { function(cmp) cmp.accept({ index = 6 }) end },
				['<A-7>'] = { function(cmp) cmp.accept({ index = 7 }) end },
				['<A-8>'] = { function(cmp) cmp.accept({ index = 8 }) end },
				['<A-9>'] = { function(cmp) cmp.accept({ index = 9 }) end },
				['<CR>'] = { 'accept', 'fallback' },
				['<A-k>'] = { 'select_prev', 'fallback' },
				['<A-j>'] = { 'select_next', 'fallback' },
				['<C-d>'] = { 'show', 'show_documentation', 'hide_documentation' }
			},
			completion = {
				menu = {
					draw = {
						columns = { { 'item_idx' }, { 'kind_icon' }, { 'label', 'label_description', gap = 1 } },
						components = {
							item_idx = {
								text = function(ctx) return tostring(ctx.idx) end,
								highlight =
								'BlinkCmpItemIdx' -- optional, only if you want to change its color
							}
						}
					}
				}
			}

		},
		-- allows extending the enabled_providers array elsewhere in your config
		-- without having to redefine it
		opts_extend = { "sources.default" }
	},

	-- LSP servers and clients communicate what features they support through "capabilities".
	--  By default, Neovim support a subset of the LSP specification.
	--  With blink.cmp, Neovim has *more* capabilities which are communicated to the LSP servers.
	--  Explanation from TJ: https://youtu.be/m8C0Cq9Uv9o?t=1275
	--

	{
		'neovim/nvim-lspconfig',
		dependencies = {
			'saghen/blink.cmp',
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
			'j-hui/fidget.nvim',
		},

		-- example using `opts` for defining servers
		opts = {
			servers = {
				lua_ls = {}
			}
		},
		config = function(_, opts)
			local lspconfig = require('lspconfig')
			for server, config in pairs(opts.servers) do
				-- passing config.capabilities to blink.cmp merges with the capabilities in your
				-- `opts[server].capabilities, if you've defined it
				config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end
		end

	},

	{ -- Highlight, edit, and navigate code
		'nvim-treesitter/nvim-treesitter',
		build = function()
			pcall(require('nvim-treesitter.install').update { with_sync = true })
		end,
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',
		}
	},

	-- Git related plugins
	-- 'tpope/vim-fugitive',
	-- 'lewis6991/gitsigns.nvim',

	'nvim-lualine/lualine.nvim', -- Fancier statusline
	'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines
	'tpope/vim-sleuth',   -- Detect tabstop and shiftwidth automatically

	-- Fuzzy Finder (files, lsp, etc)
	{ 'nvim-telescope/telescope.nvim',            branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },
	'nvim-telescope/telescope-symbols.nvim',
	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make',   cond = vim.fn.executable 'make' == 1 },
	{
		"folke/twilight.nvim",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	},
	{
		'smoka7/hop.nvim',
		version = "*",
		opts = {
			keys = 'etovxqpdygfblzhckisuran'
		}
	},
	{
		'ThePrimeagen/vim-be-good',
		cmd = 'VimBeGood' -- Optional: load the plugin only when you run the command.
	},

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function() vim.fn["mkdp#util#install"]() end,
	},

	{
		"3rd/image.nvim",
		config = function()
		end
	},
	{
		"HakonHarnes/img-clip.nvim",
		event = "VeryLazy",
		opts = {
			-- or leave it empty to use the default settings
		},
		keys = {
			-- suggested keymap
			{ "<leader><C-v>", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
		},
	},

	{
		'MeanderingProgrammer/render-markdown.nvim',
		opts = {},
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
	},


	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{
		'dkarter/bullets.vim',
		event = "VeryLazy",
	},

	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
	{
		"lervag/vimtex",
		lazy = false, -- we don't want to lazy load VimTeX
		-- tag = "v2.15", -- uncomment to pin to a specific release
		init = function()
			-- VimTeX configuration goes here, e.g.
			vim.g.vimtex_view_method = "zathura"
		end
	},

	-- {
	--   "folke/snacks.nvim",
	--   priority = 1000,
	--   lazy = false,
	--   ---@type snacks.Config
	--   opts = {
	--     styles = {
	--       notification = {
	--         wo = { wrap = true } -- Wrap notifications
	--     },
	--     snacks_image = {
	--       relative = "editor",
	--       col = -1,
	--     },
	--     },
	--     bigfile = { enabled = true },
	--     dashboard = { enabled = false },
	--     notifier = {
	--       enabled = true,
	--       timeout = 3000,
	--     },
	--     image = {
	--         -- BUG: image renders correctly sometimes, and sometimes doesn't for unclear reason.
	--             enabled = true,
	--             wo = {
	--               winhighlight = "FloatBorder:WhichKeyBorder",
	--             },
	--             doc = {
	--             -- render the image inline in the buffer
	--             -- if your env doesn't support unicode placeholders, this will be disabled
	--
	--             -- takes precedence over `opts.float` on supported terminals
	--             inline = true,
	--             -- render the image in a floating window
	--             -- only used if `opts.inline` is disabled
	--             float = true,
	--             -- Sets the size of the image
	--             -- max_width = 60,
	--             max_width = vim.g.neovim_mode == "skitty" and 20 or 50,
	--             max_height = vim.g.neovim_mode == "skitty" and 10 or 20,
	--             -- max_height = 30,
	--             -- Apparently, all the images that you preview in neovim are converted
	--             -- to .png and they're cached, original image remains the same, but
	--             -- the preview you see is a png converted version of that image
	--             --
	--             -- Where are the cached images stored?
	--             -- This path is found in the docs
	--             -- :lua print(vim.fn.stdpath("cache") .. "/snacks/image")
	--             },
	--           },
	--   },
	--   keys = {
	--     { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
	--     { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
	--     { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
	--     { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
	--     { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
	--     { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse" },
	--     { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
	--     { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
	--     { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
	--     { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)" },
	--     { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
	--     { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
	--     { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
	--     { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
	--     { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
	--     {
	--       "<leader>N",
	--       desc = "Neovim News",
	--       function()
	--         Snacks.win({
	--           file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
	--           width = 0.6,
	--           height = 0.6,
	--           wo = {
	--             spell = false,
	--             wrap = false,
	--             signcolumn = "yes",
	--             statuscolumn = " ",
	--             conceallevel = 3,
	--           },
	--         })
	--       end,
	--     }
	--   },
	--   init = function()
	--     vim.api.nvim_create_autocmd("User", {
	--       pattern = "VeryLazy",
	--       callback = function()
	--         -- Setup some globals for debugging (lazy-loaded)
	--         _G.dd = function(...)
	--           Snacks.debug.inspect(...)
	--         end
	--         _G.bt = function()
	--           Snacks.debug.backtrace()
	--         end
	--         vim.print = _G.dd -- Override print to use snacks for `:=` command
	--
	--         -- Create some toggle mappings
	--         Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
	--         Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
	--         Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
	--         Snacks.toggle.diagnostics():map("<leader>ud")
	--         Snacks.toggle.line_number():map("<leader>ul")
	--         Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
	--         Snacks.toggle.treesitter():map("<leader>uT")
	--         Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
	--         Snacks.toggle.inlay_hints():map("<leader>uh")
	--       end,
	--     })
	--   end,
	-- },
	{
		'mluders/comfy-line-numbers.nvim',
		opts = {
			labels = {
				'1', '2', '3', '4', '5', '11', '12', '13', '14', '15',
				'21', '22', '23', '24', '25', '31', '32', '33', '34', '35',
				'41', '42', '43', '44', '45', '51', '52', '53', '54', '55',
				'111', '112', '113', '114', '115', '121', '122', '123', '124', '125',
				'131', '132', '133', '134', '135', '141', '142', '143', '144', '145',
				'151', '152', '153', '154', '155', '211', '212', '213', '214', '215',
				'221', '222', '223', '224', '225', '231', '232', '233', '234', '235',
				'241', '242', '243', '244', '245', '251', '252', '253', '254', '255',
			},
			up_key = 'k',
			down_key = 'j',
			hidden_file_types = { 'undotree' },
			hidden_buffer_types = { 'terminal' },
		},
	},


}, {
	defaults = {
		lazy = true,
		event = "BufRead",
	},
})
