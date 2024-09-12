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
		"ActivityWatch/aw-watcher-vim",
		"lukas-reineke/headlines.nvim",
		{
			"iamcco/markdown-preview.nvim",
			cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
			ft = { "markdown" },
			build = function() vim.fn["mkdp#util#install"]() end,
		},
		"navarasu/onedark.nvim",
		{"nvim-treesitter/nvim-treesitter", run = ':TSUpdate'},
		--"nvim-treesitter/playground",
		"tpope/vim-fugitive",
		"folke/todo-comments.nvim",
		"preservim/tagbar",
		--"tpope/vim-commentary",
		"numToStr/Comment.nvim",
		"epwalsh/obsidian.nvim",
		"preservim/vim-markdown",
		"lukas-reineke/indent-blankline.nvim",
		{ "nvim-lualine/lualine.nvim", dependencies = {'nvim-tree/nvim-web-devicons'} },
		"glepnir/dashboard-nvim",
		"VonHeikemen/lsp-zero.nvim",
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
		"rafamadriz/friendly-snippets",
		"tummetott/reticle.nvim",
		--"pocco81/dap-buddy.nvim",

		-- svelte
		{ "evanleck/vim-svelte", dependencies = {
			"leafgarland/typescript-vim",
			"othree/html5.vim"
		}
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
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = { "c", "python", "cpp", "lua", "vim", "vimdoc", "query" },

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

require("obsidian").setup(
	{
		-- A list of workspace names, paths, and configuration overrides.
		-- If you use the Obsidian app, the 'path' of a workspace should generally be
		-- your vault root (where the `.obsidian` folder is located).
		-- When obsidian.nvim is loaded by your plugin manager, it will automatically set
		-- the workspace to the first workspace in the list whose `path` is a parent of the
		-- current markdown file being edited.
		workspaces = {
			{
				name = "personal",
				path = "~/Documents/Obsidian",
			},
		},

		-- Alternatively - and for backwards compatibility - you can set 'dir' to a single path instead of
		-- 'workspaces'. For example:
		-- dir = "~/vaults/work",

		-- Optional, if you keep notes in a specific subdirectory of your vault.
		notes_subdir = nil,

		-- Optional, set the log level for obsidian.nvim. This is an integer corresponding to one of the log
		-- levels defined by "vim.log.levels.*".
		log_level = vim.log.levels.INFO,

		daily_notes = {
			-- Optional, if you keep daily notes in a separate directory.
			folder = nil,
			-- Optional, if you want to change the date format for the ID of daily notes.
			date_format = "%Y-%m-%d",
			-- Optional, if you want to change the date format of the default alias of daily notes.
			alias_format = "%B %-d, %Y",
			-- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
			template = nil
		},

		-- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
		completion = {
			-- Set to false to disable completion.
			nvim_cmp = true,
			-- Trigger completion at 2 chars.
			min_chars = 2,
		},

		-- Optional, configure key mappings. These are the defaults. If you don't want to set any keymappings this
		-- way then set 'mappings = {}'.
		mappings = {
			-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
			["gf"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
			},
			-- Toggle check-boxes.
			["<leader>ch"] = {
				action = function()
					return require("obsidian").util.toggle_checkbox()
				end,
				opts = { buffer = true },
			},
			-- Smart action depending on context, either follow link or toggle checkbox.
			["<cr>"] = {
				action = function()
					return require("obsidian").util.smart_action()
				end,
				opts = { buffer = true, expr = true },
			}
		},

		-- Where to put new notes. Valid options are
		--  * "current_dir" - put new notes in same directory as the current buffer.
		--  * "notes_subdir" - put new notes in the default notes subdirectory.
		new_notes_location = "notes_subdir",

		-- Optional, customize how note IDs are generated given an optional title.
		---@param title string|?
		---@return string
		note_id_func = function(title)
			-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
			-- In this case a note with the title 'My new note' will be given an ID that looks
			-- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
			local suffix = ""
			if title ~= nil then
				-- If title is given, transform it into valid file name.
				suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
			else
				-- If title is nil, just add 4 random uppercase letters to the suffix.
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			end
			return tostring(os.time()) .. "-" .. suffix
		end,

		-- Optional, customize how note file names are generated given the ID, target directory, and title.
		---@param spec { id: string, dir: obsidian.Path, title: string|? }
		---@return string|obsidian.Path The full path to the new note.
		note_path_func = function(spec)
			-- This is equivalent to the default behavior.
			local path = spec.dir / tostring(spec.id)
			return path:with_suffix(".md")
		end,

		-- Optional, customize how wiki links are formatted. You can set this to one of:
		--  * "use_alias_only", e.g. '[[Foo Bar]]'
		--  * "prepend_note_id", e.g. '[[foo-bar|Foo Bar]]'
		--  * "prepend_note_path", e.g. '[[foo-bar.md|Foo Bar]]'
		--  * "use_path_only", e.g. '[[foo-bar.md]]'
		-- Or you can set it to a function that takes a table of options and returns a string, like this:
		wiki_link_func = function(opts)
			return require("obsidian.util").wiki_link_id_prefix(opts)
		end,

		-- Optional, customize how markdown links are formatted.
		markdown_link_func = function(opts)
			return require("obsidian.util").markdown_link(opts)
		end,

		-- Either 'wiki' or 'markdown'.
		preferred_link_style = "wiki",

		-- Optional, customize the default name or prefix when pasting images via `:ObsidianPasteImg`.
		---@return string
		image_name_func = function()
			-- Prefix image names with timestamp.
			return string.format("%s-", os.time())
		end,

		-- Optional, boolean or a function that takes a filename and returns a boolean.
		-- `true` indicates that you don't want obsidian.nvim to manage frontmatter.
		disable_frontmatter = false,

		-- Optional, alternatively you can customize the frontmatter data.
		---@return table
		note_frontmatter_func = function(note)
			-- Add the title of the note as an alias.
			if note.title then
				note:add_alias(note.title)
			end

			local out = { id = note.id, aliases = note.aliases, tags = note.tags }

			-- `note.metadata` contains any manually added fields in the frontmatter.
			-- So here we just make sure those fields are kept in the frontmatter.
			if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
				for k, v in pairs(note.metadata) do
					out[k] = v
				end
			end

			return out
		end,

		-- Optional, for templates (see below).
		templates = {
			folder = "Templates",
			date_format = "%Y-%m-%d",
			time_format = "%H:%M",
			-- A map for custom variables, the key should be the variable and the value a function
			substitutions = {},
		},

		-- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
		-- URL it will be ignored but you can customize this behavior here.
		---@param url string
		follow_url_func = function(url)
			-- Open the URL in the default web browser.
			vim.fn.jobstart({"open", url})  -- Mac OS
			-- vim.fn.jobstart({"xdg-open", url})  -- linux
		end,

		-- Optional, set to true if you use the Obsidian Advanced URI plugin.
		-- https://github.com/Vinzent03/obsidian-advanced-uri
		use_advanced_uri = false,

		-- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
		open_app_foreground = false,

		picker = {
			-- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
			name = "telescope.nvim",
			-- Optional, configure key mappings for the picker. These are the defaults.
			-- Not all pickers support all mappings.
			mappings = {
				-- Create a new note from your query.
				new = "<C-x>",
				-- Insert a link to the selected note.
				insert_link = "<C-l>",
			},
		},

		-- Optional, sort search results by "path", "modified", "accessed", or "created".
		-- The recommend value is "modified" and `true` for `sort_reversed`, which means, for example,
		-- that `:ObsidianQuickSwitch` will show the notes sorted by latest modified time
		sort_by = "modified",
		sort_reversed = true,

		-- Optional, determines how certain commands open notes. The valid options are:
		-- 1. "current" (the default) - to always open in the current window
		-- 2. "vsplit" - to open in a vertical split if there's not already a vertical split
		-- 3. "hsplit" - to open in a horizontal split if there's not already a horizontal split
		open_notes_in = "hsplit",

		-- Optional, define your own callbacks to further customize behavior.
		callbacks = {
			-- Runs at the end of `require("obsidian").setup()`.
			---@param client obsidian.Client
			post_setup = function(client) end,

			-- Runs anytime you enter the buffer for a note.
			---@param client obsidian.Client
			---@param note obsidian.Note
			enter_note = function(client, note) end,

			-- Runs anytime you leave the buffer for a note.
			---@param client obsidian.Client
			---@param note obsidian.Note
			leave_note = function(client, note) end,

			-- Runs right before writing the buffer for a note.
			---@param client obsidian.Client
			---@param note obsidian.Note
			pre_write_note = function(client, note) end,

			-- Runs anytime the workspace is set/changed.
			---@param client obsidian.Client
			---@param workspace obsidian.Workspace
			post_set_workspace = function(client, workspace) end,
		},

		-- Optional, configure additional syntax highlighting / extmarks.
		-- This requires you have `conceallevel` set to 1 or 2. See `:help conceallevel` for more details.
		ui = {
			enable = true,  -- set to false to disable all additional syntax features
			update_debounce = 200,  -- update delay after a text change (in milliseconds)
			-- Define how various check-boxes are displayed
			checkboxes = {
				-- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
				[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
				["x"] = { char = "", hl_group = "ObsidianDone" },
				[">"] = { char = "", hl_group = "ObsidianRightArrow" },
				["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
				-- Replace the above with this if you don't have a patched font:
				-- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
				-- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

				-- You can also add more custom ones...
			},
			-- Use bullet marks for non-checkbox lists.
			bullets = { char = "‣", hl_group = "ObsidianBullet" },
			external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
			-- Replace the above with this if you don't have a patched font:
			-- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
			reference_text = { hl_group = "ObsidianRefText" },
			highlight_text = { hl_group = "ObsidianHighlightText" },
			tags = { hl_group = "ObsidianTag" },
			block_ids = { hl_group = "ObsidianBlockID" },
			hl_groups = {
				-- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
				ObsidianTodo = { bold = true, fg = "#f78c6c" },
				ObsidianDone = { bold = true, fg = "#89ddff" },
				ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
				ObsidianTilde = { bold = true, fg = "#ff5370" },
				ObsidianBullet = { bold = true, fg = "#89ddff" },
				ObsidianRefText = { underline = true, fg = "#c792ea" },
				ObsidianExtLinkIcon = { fg = "#c792ea" },
				ObsidianTag = { italic = true, fg = "#89ddff" },
				ObsidianBlockID = { italic = true, fg = "#89ddff" },
				ObsidianHighlightText = { bg = "#2E4B75" },
			},
		},

		-- Specify how to handle attachments.
		attachments = {
			-- The default folder to place images in via `:ObsidianPasteImg`.
			-- If this is a relative path it will be interpreted as relative to the vault root.
			-- You can always override this per image by passing a full path to the command instead of just a filename.
			img_folder = "assets/imgs",  -- This is the default
			-- A function that determines the text to insert in the note when pasting an image.
			-- It takes two arguments, the `obsidian.Client` and an `obsidian.Path` to the image file.
			-- This is the default implementation.
			---@param client obsidian.Client
			---@param path obsidian.Path the absolute path to the image file
			---@return string
			img_text_func = function(client, path)
				path = client:vault_relative_path(path) or path
				return string.format("![%s](%s)", path.name, path)
			end,
		},
	}
)

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


require("noice").setup({
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
		},
	},
	-- you can enable a preset for easier configuration
	--

	presets = {
		bottom_search = true, -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},
})

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
require("nvim-tree").setup()

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
