vim.g.mapleader = "\\"
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- telescope fuzzy file finder
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Find string: ")});
end)


local comment = require('Comment.api')
vim.keymap.set('n', '<C-/>', comment.toggle.linewise.current, {})

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>tt", vim.cmd.Tagbar)
vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>gf", vim.cmd.ObsidianBacklink)
vim.keymap.set("n", "<leader>T", function()
	vim.cmd.split()
	vim.cmd.terminal()
end)

-- Manipulating tabs and splitting windows
vim.keymap.set("n", "[W", vim.cmd.tabprevious)
vim.keymap.set("n", "]W", vim.cmd.tabnext)
vim.keymap.set("n", "<leader>W", vim.cmd.tabnew)
vim.keymap.set("n", "<leader>X", vim.cmd.split)
vim.keymap.set("n", "<leader>V", vim.cmd.vsplit)

vim.keymap.set("n", "<leader>td", vim.cmd.TodoQuickFix)

-- Buffers
vim.keymap.set("n", "]b", vim.cmd.bnext)
vim.keymap.set("n", "[b", vim.cmd.bprevious)
vim.keymap.set("n", "<leader>B", vim.cmd.bdelete)
vim.keymap.set("n", "<leader>bn", vim.cmd.BufferLineMoveNext)
vim.keymap.set("n", "<leader>bp", vim.cmd.BufferLineMovePrev)
vim.keymap.set("n", "<leader>bb", vim.cmd.BufferLineCloseOthers)

-- Color manipulation with Colortils (https://github.com/max397574/colortils.nvim)
vim.keymap.set("n", "c", vim.cmd.Colortils)

-- DAP (https://github.com/mfussenegger/nvim-dap)
-- local dap = require('dap')
-- vim.keymap.set("n", "<leader>da", dap.toggle_breakpoint)
-- vim.keymap.set("n", "<leader>dd", dap.continue)
-- vim.keymap.set("n", "<leader>dn", dap.step_over)
-- vim.keymap.set("n", "<leader>di", dap.step_into)
-- vim.keymap.set("n", "<leader>do", dap.step_out)
-- vim.keymap.set("n", "<leader>dr", dap.repl.open)


