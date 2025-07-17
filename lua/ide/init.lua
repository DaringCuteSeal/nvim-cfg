require "ide.plugs"
require "ide.lsp"
require "ide.debug"
require "ide.remap"

print "Welcome! Happy coding."

-- Colorscheme
vim.cmd [[colorscheme onedark]]

-- Options
vim.cmd [[set number]]
vim.cmd [[set undodir=~/.cache/nvim/undo]]
vim.cmd [[set backupdir=~/.cache/nvim/backup]]
vim.cmd [[set directory=~/.cache/nvim/swap]]
vim.cmd [[set undofile]]
vim.cmd [[set backup]]
vim.cmd [[set linebreak]]
vim.cmd [[set ic]]
vim.cmd [[set updatetime=500]]
vim.cmd [[set conceallevel=2]]
vim.cmd [[ let g:vim_markdown_folding_disabled = 1 ]]
vim.cmd [[ let g:vim_markdown_frontmatter = 1 ]]
--vim.cmd [[ AWStart ]]
vim.cmd [[set shiftwidth=4]]
vim.cmd [[set tabstop=4]]

-- Disable the "how-to disable mouse" menu item
vim.cmd [[aunmenu PopUp.How-to\ disable\ mouse]]
vim.cmd [[aunmenu PopUp.-1-]]

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- Other configurations

-- autocommands
local api = vim.api
-- This function is taken from https://github.com/norcalli/nvim_utils
function nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    api.nvim_command('augroup '..group_name)
    api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.iter({'autocmd', def}):flatten():totable(), ' ')
      api.nvim_command(command)
    end
    api.nvim_command 'augroup END'
  end
end

local autocmds = {
    reload_vimrc = {
        -- Reload vim config automatically
        {"BufWritePost",[[$VIM_PATH/{*.vim,*.yaml,vimrc} nested source $MYVIMRC | redraw]]};
    };
    terminal_job = {
        --{ "TermOpen", "*", [[tnoremap <buffer> <Esc> <c-\><c-n>]] };
        { "TermOpen", "*", "startinsert" };
        { "TermOpen", "*", "setlocal listchars= nonumber norelativenumber nospell" };
    };
    restore_cursor = {
        { 'BufRead', '*', [[call setpos(".", getpos("'\""))]] };
    };
    save_shada = {
        {"VimLeave", "*", "wshada!"};
    };
    resize_windows_proportionally = {
        { "VimResized", "*", ":wincmd =" };
    };
    toggle_search_highlighting = {
        { "InsertEnter", "*", "setlocal nohlsearch" };
    };
    lua_highlight = {
        { "TextYankPost", "*", [[silent! lua vim.highlight.on_yank() {higroup="IncSearch", timeout=400}]] };
    };
    ansi_esc_log = {
        { "BufEnter", "*.log", ":AnsiEsc" };
    };
}

nvim_create_augroups(autocmds)


vim.opt.title = true
vim.opt.titlelen = 0
vim.opt.titlestring = 'nvim IDE %{expand("%")}'
vim.cmd [[set textwidth=80]]
