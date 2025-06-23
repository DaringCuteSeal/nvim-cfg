local lsp = require('lsp-zero')

local cmp = require('cmp')
local cmp_select = {behaviour = cmp.SelectHevari}
-- local cmp_mappings = lsp.defaults.cmp_mappings({
-- 	['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
-- 	['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
-- 	['<C-y>'] = cmp.mapping.confirm({ select = true }),
-- 	['<C-Space>'] = cmp.mapping.complete(),
-- })

local luasnip = require('luasnip')
cmp.setup({
	formatting = {
		format = require("nvim-highlight-colors").format
	},

	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	},
})
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('user_lsp_attach', {clear = true}),
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', '<leader>vs', function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set('n', '<leader>d', function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('n', '<leader>vr', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('n', '<F2>', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
  end,
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'clangd', 'rust_analyzer'},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({
        capabilities = lsp_capabilities,
      })
    end,
  }
})

vim.diagnostic.config({
    virtual_text = true
})

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'moonfly',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}



-- Arduino

Lspconfig = require('lspconfig')
local MY_FQBN = "arduino:avr:uno"
Lspconfig.lua_ls.setup({})
Lspconfig.arduino_language_server.setup {
    cmd = {
        "arduino-language-server",
		"-cli-config", "/home/cikitta/.arduino15/arduino-cli.yaml",
		"-clangd", "/usr/bin/clangd",
		"-cli", "/usr/bin/arduino-cli",
		"-fqbn",
        MY_FQBN
    }
}



-- rust formatter yay
vim.cmd([[let g:rustfmt_autosave = 1 ]])
vim.cmd([[let g:ale_rust_cargo_clippy_options = '-- -W clippy::nursery -W clippy::pedantic']])


-- inlay hints uwu
if vim.lsp.inlay_hint then
  vim.lsp.inlay_hint.enable(true, { 0 })
end
