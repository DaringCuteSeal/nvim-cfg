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
require("lazy").setup(
	{
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
		"shaunsingh/nord.nvim",
		--"ActivityWatch/aw-watcher-vim",
		"lukas-reineke/headlines.nvim",
		{
			"iamcco/markdown-preview.nvim",
			cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
			ft = { "markdown" },
			build = function() vim.fn["mkdp#util#install"]() end,
		},
		"navarasu/onedark.nvim",
		{"nvim-treesitter/nvim-treesitter", run = ':TSUpdate', dependencies = {'nushell/tree-sitter-nu'}},
		--"nvim-treesitter/playground",
		"tpope/vim-fugitive",
		"folke/todo-comments.nvim",
		--"tpope/vim-commentary",
		"numToStr/Comment.nvim",
		--"epwalsh/obsidian.nvim",
		"preservim/vim-markdown",
		"lukas-reineke/indent-blankline.nvim",
		{ "nvim-lualine/lualine.nvim", dependencies = {'nvim-tree/nvim-web-devicons'} },
		"glepnir/dashboard-nvim",
		"VonHeikemen/lsp-zero.nvim",
		"RaafatTurki/hex.nvim",
		"folke/noice.nvim",
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/nvim-cmp",
		--"vuciv/vim-bujo",
		{ "pablopunk/todo.nvim", opts = { map = "<leader>vtd" }},
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"RishabhRD/popfix",
		"airblade/vim-gitgutter",
		--"m4xshen/autoclose.nvim",
		--"altermo/ultimate-autopair.nvim",
		"windwp/nvim-autopairs",
		"saadparwaiz1/cmp_luasnip",
		"akinsho/bufferline.nvim",
		"max397574/colortils.nvim",
		"hrsh7th/cmp-nvim-lsp",
		--"lvimuser/lsp-inlayhints.nvim",
		--"mfussenegger/nvim-dap",
		"hrsh7th/cmp-nvim-lua",
		'brenoprata10/nvim-highlight-colors',
		"edKotinsky/Arduino.nvim",
		{ "nvim-tree/nvim-tree.lua", dependencies = {'nvim-tree/nvim-web-devicons'}},
		"L3MON4D3/LuaSnip",
		-- with lazy.nvim

		{'glepnir/template.nvim', cmd = {'Template','TemProject'}, config = function()
			require('template').setup({
				temp_dir = '~/.config/nvim/templates',
				author = 'daringcuteseal',
				email = 'daringcuteseal@gmail.com',
			})
		end},

		-- lazy load you can use cmd or ft. if you are using cmd to lazyload when you edit the template file
		-- you may see some diagnostics in template file. use ft to lazy load the diagnostic not display
		-- when you edit the template file.
		
		"rafamadriz/friendly-snippets",
		"tummetott/reticle.nvim",
		{
		  "folke/trouble.nvim",
		  opts = {},
		  cmd = "Trouble",
		  keys = {
			{
			  "<leader>vD",
			  "<cmd>Trouble diagnostics toggle<cr>",
			  desc = "Diagnostics (Trouble)",
			},
			{
			  "<leader>vd",
			  "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			  desc = "Buffer Diagnostics (Trouble)",
			},
			{
			  "<leader>tt",
			  "<cmd>Trouble symbols toggle focus=false<cr>",
			  desc = "Symbols (Trouble)",
			},
			{
			  "<leader>cl",
			  "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			  desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
			  "<leader>xL",
			  "<cmd>Trouble loclist toggle<cr>",
			  desc = "Location List (Trouble)",
			},
			{
			  "<leader>xQ",
			  "<cmd>Trouble qflist toggle<cr>",
			  desc = "Quickfix List (Trouble)",
			},
		  },
		},
		--"pocco81/dap-buddy.nvim",
		--{
		-- svelte
		{ "evanleck/vim-svelte", dependencies = {
			"leafgarland/typescript-vim",
			"othree/html5.vim"
		}
		},
		{
			"lervag/vimtex",
			lazy = false,     -- we don't want to lazy load VimTeX
			-- tag = "v2.15", -- uncomment to pin to a specific release
			init = function()
				-- VimTeX configuration goes here, e.g.
				vim.g.vimtex_view_general_viewer = "evince"
				vim.g.vimtex_view_general_options = "@pdf"
			end
		},
		{
			'nvimdev/dashboard-nvim',
			event = 'VimEnter',
			config = function()
				require('dashboard').setup {
					theme = 'hyper',
					config = {
						-- header = {
						-- "/\\ ",
						-- "/  \\ ",
						-- "/`'.,\\ ",
						-- "/     ', ",
						-- "/      ,`\\ ",
						-- "/   ,.'`.  \\ ",
						-- "/.,'`     `'.\\ ",
						-- "Hello!         Artix LinUwU 4ever",
						-- ""
						header = {
							" .---.",
							" /o   o\\",
							" __(=  \"  =)__",
							"//\\'-=-'/\\",
							"  )   (_",
							"       /      `\"=-._",
							"           /       \\     ``\"=.",
							" Hey! >           /  /   \\  \\         `=..--.",
							"                ___/  /     \\  \\___      _,  , `\\",
							"               `-----' `----`'-----``\"\"\"`  \\  \\_/",
							"                                          `-`"



						},
						shortcut = {
							{ desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
							{
								icon = ' ',
								icon_hl = '@variable',
								desc = 'Files',
								group = 'Label',
								action = 'Telescope find_files',
								key = 'f',
							},
							{
								desc = ' Edit Config',
								group = 'Number',
								action = 'e ~/.config/nvim/',
								key = 'd',
							},
							{
								icon=' ',
								desc="GitHub",
								group = "DiagnosticHint",
								action = "!xdg-open 'https://github.com/DaringCuteSeal/'",
								key = 'g',
							}
						},
					},
				}
				-- config

			end,
			dependencies = { {'nvim-tree/nvim-web-devicons'}}
		}
	}

)




-- Configurations
require('onedark').setup {
	style = 'dark',
	transparent = true,
	code_style = {
		comments = 'italic',
		keywords = 'bold',
		functions = 'none',
		strings = 'none',
		variables = 'none'
	}
}


require("headlines").setup()



require'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all"
	ensure_installed = { "c", "python", "cpp", "lua", "vim", "vimdoc", "query"},

	indent = {
		enable = true,
	},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	-- List of parsers to ignore installing (or "all")
	ignore_install = { "javascript" },

	---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
	-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

	highlight = {
		enable = true,

		-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
		-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
		-- the name of the parser)
		-- list of language that will be disabled
		-- disable = { "c", "rust" },
		-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
		--
		-- disable = function(lang, buf)
		--     local max_filesize = 100 * 1024 -- 100 KB
		--     local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
		--     if ok and stats and stats.size > max_filesize then
		--         return true
		--     end
		-- end,

		disable = {"markdown", "markdown_inline", "svelte", "rust"},

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
}



vim.diagnostic.config({
	virtual_text = true
})


require("nvim-autopairs").setup()

--vim.fn.sign_define('DapBreakpoint', {text='', texthl='', linehl='', numhl=''})
--vim.fn.sign_define('DapBreakpointCondition', {text='󰏄', texthl='', linehl='', numhl=''})
--vim.fn.sign_define('DapBreakpointRejected', {text='󰅜', texthl='', linehl='', numhl=''})
--vim.fn.sign_define('DapLogPoint', {text='', texthl='', linehl='', numhl=''})


local highlight = {
	"RainbowRed",
	"RainbowYellow",
	"RainbowBlue",
	"RainbowOrange",
	"RainbowGreen",
	"RainbowViolet",
	"RainbowCyan",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#B1585F" })
	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#B1AA58" })
	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#668AB3" })
	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#A66D5B" })
	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#5BA676" })
	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#81649B" })
	vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#659EB3" })
end)

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "ScopeHl", { fg = "#848488" })
end)

require("ibl").setup {
	indent = {
		highlight = highlight, char = '|'
	},
	exclude = {
		filetypes = {"lspinfo", "packer", "checkhealth", "help", "man", "gitcommit", "TelescopePrompt", "TelescopeResults", "dashboard"}},
	scope = {
		enabled = true,
		highlight = "ScopeHl",
	}
}







require("Comment").setup()


require("todo-comments").setup()

vim.opt.termguicolors = true
require("bufferline").setup({
	options = {
		separator_style = {"|", "|"},
		indicator = {
			style = 'underline',
		},
		diagnostics = "nvim_lsp",
	}
}
)

require('reticle').setup {
}


require("noice").setup(
	{
		cmdline = {
			enabled = true, -- enables the Noice cmdline UI
			view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
			opts = {}, -- global options for the cmdline. See section on views
			---@type table<string, CmdlineFormat>
			format = {
				-- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
				-- view: (default is cmdline view)
				-- opts: any options passed to the view
				-- icon_hl_group: optional hl_group for the icon
				-- title: set to anything or empty string to hide
				cmdline = { pattern = "^:", icon = "", lang = "vim" },
				search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
				search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
				filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
				lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
				help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
				input = { view = "cmdline_input", icon = "󰥻 " }, -- Used by input()
				-- lua = false, -- to disable a format, set to `false`
			},
		},
		messages = {
			-- NOTE: If you enable messages, then the cmdline is enabled automatically.
			-- This is a current Neovim limitation.
			enabled = true, -- enables the Noice messages UI
			view = "notify", -- default view for messages
			view_error = "notify", -- view for errors
			view_warn = "notify", -- view for warnings
			view_history = "messages", -- view for :messages
			view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
		},
		popupmenu = {
			enabled = true, -- enables the Noice popupmenu UI
			---@type 'nui'|'cmp'
			backend = "nui", -- backend to use to show regular cmdline completions
			---@type NoicePopupmenuItemKind|false
			-- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
			kind_icons = {}, -- set to `false` to disable icons
		},
		-- default options for require('noice').redirect
		-- see the section on Command Redirection
		---@type NoiceRouteConfig
		redirect = {
			view = "popup",
			filter = { event = "msg_show" },
		},
		-- You can add any custom commands below that will be available with `:Noice command`
		---@type table<string, NoiceCommand>
		commands = {
			history = {
				-- options for the message history that you get with `:Noice`
				view = "split",
				opts = { enter = true, format = "details" },
				filter = {
					any = {
						{ event = "notify" },
						{ error = true },
						{ warning = true },
						{ event = "msg_show", kind = { "" } },
						{ event = "lsp", kind = "message" },
					},
				},
			},
			-- :Noice last
			last = {
				view = "popup",
				opts = { enter = true, format = "details" },
				filter = {
					any = {
						{ event = "notify" },
						{ error = true },
						{ warning = true },
						{ event = "msg_show", kind = { "" } },
						{ event = "lsp", kind = "message" },
					},
				},
				filter_opts = { count = 1 },
			},
			-- :Noice errors
			errors = {
				-- options for the message history that you get with `:Noice`
				view = "popup",
				opts = { enter = true, format = "details" },
				filter = { error = true },
				filter_opts = { reverse = true },
			},
			all = {
				-- options for the message history that you get with `:Noice`
				view = "split",
				opts = { enter = true, format = "details" },
				filter = {},
			},
		},
		notify = {
			-- Noice can be used as `vim.notify` so you can route any notification like other messages
			-- Notification messages have their level and other properties set.
			-- event is always "notify" and kind can be any log level as a string
			-- The default routes will forward notifications to nvim-notify
			-- Benefit of using Noice for this is the routing and consistent history view
			enabled = true,
			view = "notify",
		},
		lsp = {
			progress = {
				enabled = true,
				-- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
				-- See the section on formatting for more details on how to customize.
				--- @type NoiceFormat|string
				format = "lsp_progress",
				--- @type NoiceFormat|string
				format_done = "lsp_progress_done",
				throttle = 1000 / 30, -- frequency to update lsp progress message
				view = "mini",
			},
			override = {
				-- override the default lsp markdown formatter with Noice
				["vim.lsp.util.convert_input_to_markdown_lines"] = false,
				-- override the lsp markdown formatter with Noice
				["vim.lsp.util.stylize_markdown"] = false,
				-- override cmp documentation with Noice (needs the other options to work)
				["cmp.entry.get_documentation"] = false,
			},
			hover = {
				enabled = true,
				silent = false, -- set to true to not show a message if hover is not available
				view = nil, -- when nil, use defaults from documentation
				---@type NoiceViewOptions
				opts = {}, -- merged with defaults from documentation
			},
			signature = {
				enabled = true,
				auto_open = {
					enabled = true,
					trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
					luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
					throttle = 50, -- Debounce lsp signature help request by 50ms
				},
				view = nil, -- when nil, use defaults from documentation
				---@type NoiceViewOptions
				opts = {}, -- merged with defaults from documentation
			},
			message = {
				-- Messages shown by lsp servers
				enabled = true,
				view = "notify",
				opts = {},
			},
			-- defaults for hover and signature help
			documentation = {
				view = "hover",
				---@type N}oiceViewOptions
				opts = {
					lang = "markdown",
					replace = true,
					render = "plain",
					format = { "{message}" },
					win_options = { concealcursor = "n", conceallevel = 3 },
				},
			},
		},
		markdown = {
			hover = {
				["|(%S-)|"] = vim.cmd.help, -- vim help links
				["%[.-%]%((%S-)%)"] = require("noice.util").open, -- markdown links
			},
			highlights = {
				["|%S-|"] = "@text.reference",
				["@%S+"] = "@parameter",
				["^%s*(Parameters:)"] = "@text.title",
				["^%s*(Return:)"] = "@text.title",
				["^%s*(See also:)"] = "@text.title",
				["{%S-}"] = "@parameter",
			},
		},
		health = {
			checker = true, -- Disable if you don't want health checks to run
		},
		---@type NoicePresets
		presets = {
			-- you can enable a preset by setting it to true, or a table that will override the preset config
			-- you can also add custom presets that you can enable/disable with enabled=true
			bottom_search = true, -- use a classic bottom cmdline for search
			command_palette = true, -- position the cmdline and popupmenu together
			long_message_to_split = false, -- long messages will be sent to a split
			inc_rename = false, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = false, -- add a border to hover docs and signature help
		},
		throttle = 1000 / 30, -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
		---@type NoiceConfigViews
		views = {}, ---@see section on views
		---@type NoiceRouteConfig[]
		routes = {}, --- @see section on routes
		---@type table<string, NoiceFilter>
		status = {}, --- @see section on statusline components
		---@type NoiceFormatOptions
		format = {}, --- @see section on formatting
	}
)

require("colortils").setup(
	{
		-- Register in which color codes will be copied
		register = "\"",
		-- Preview for colors, if it contains `%s` this will be replaced with a hex color code of the color
		color_preview =  "█ %s",
		-- The default in which colors should be saved
		-- This can be hex, hsl or rgb
		default_format = "hex",
		-- String: default color if no color is found
		default_color = "#000000",
		-- Border for the float
		border = "rounded",
		-- Some mappings which are used inside the tools
		mappings = {
			-- increment values
			increment = "l",
			-- decrement values
			decrement = "h",
			-- increment values with bigger steps
			increment_big = "L",
			-- decrement values with bigger steps
			decrement_big = "H",
			-- set values to the minimum
			min_value = "0",
			-- set values to the maximum
			max_value = "$",
			-- save the current color in the register specified above with the format specified above
			set_register_default_format = "<cr>",
			-- save the current color in the register specified above with a format you can choose
			set_register_choose_format = "g<cr>",
			-- replace the color under the cursor with the current color in the format specified above
			replace_default_format = "<m-cr>",
			-- replace the color under the cursor with the current color in a format you can choose
			replace_choose_format = "g<m-cr>",
			-- export the current color to a different tool
			export = "E",
			-- set the value to a certain number (done by just entering numbers)
			set_value = "c",
			-- toggle transparency
			transparency = "T",
			-- choose the background (for transparent colors)
			choose_background = "B",
		}
	}

)


require('nvim-highlight-colors').setup({

	---Render style
	---@usage 'background'|'foreground'|'virtual'
	render = 'background',

	---Set virtual symbol (requires render to be set to 'virtual')
	virtual_symbol = '',

	---Set virtual symbol suffix (defaults to '')
	virtual_symbol_prefix = '',

	---Set virtual symbol suffix (defaults to ' ')
	virtual_symbol_suffix = ' ',

	---Set virtual symbol position()
	---@usage 'inline'|'eol'|'eow'
	---inline mimics VS Code style
	---eol stands for `end of column` - Recommended to set `virtual_symbol_suffix = ''` when used.
	---eow stands for `end of word` - Recommended to set `virtual_symbol_prefix = ' ' and virtual_symbol_suffix = ''` when used.
	virtual_symbol_position = 'inline',

	---Highlight hex colors, e.g. '#FFFFFF'
	enable_hex = true,

	---Highlight short hex colors e.g. '#fff'
	enable_short_hex = true,

	---Highlight rgb colors, e.g. 'rgb(0 0 0)'
	enable_rgb = true,

	---Highlight hsl colors, e.g. 'hsl(150deg 30% 40%)'
	enable_hsl = true,

	---Highlight CSS variables, e.g. 'var(--testing-color)'
	enable_var_usage = true,

	---Highlight named colors, e.g. 'green'
	enable_named_colors = true,

	---Highlight tailwind colors, e.g. 'bg-blue-500'
	enable_tailwind = false,

	---Set custom colors
	---Label must be properly escaped with '%' to adhere to `string.gmatch`
	--- :help string.gmatch
	custom_colors = {
		{ label = '%-%-theme%-primary%-color', color = '#0f1219' },
		{ label = '%-%-theme%-secondary%-color', color = '#5a5d64' },
	},

	-- Exclude filetypes or buftypes from highlighting e.g. 'exclude_buftypes = {'text'}'
	exclude_filetypes = {},
	exclude_buftypes = {}
}
)
-- empty setup using defaults
require "nvim-tree".setup()

-- OR setup with some options
require("nvim-tree").setup({
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
})

-- defaults
require 'hex'.setup {

  -- cli command used to dump hex data
  dump_cmd = 'xxd -g 1 -u',

  -- cli command used to assemble from hex data
  assemble_cmd = 'xxd -r',
  
  -- function that runs on BufReadPre to determine if it's binary or not
  is_file_binary_pre_read = function()
    -- logic that determines if a buffer contains binary data or not
    -- must return a bool
  end,

  -- function that runs on BufReadPost to determine if it's binary or not
  is_file_binary_post_read = function()
    -- logic that determines if a buffer contains binary data or not
    -- must return a bool
  end,
}
