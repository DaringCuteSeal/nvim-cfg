-- local dap = require("dap")

-- dap.adapters.gdb = {
--   type = "executable",
--   command = "gdb",
--   args = { "-i", "dap" }
-- }

-- dap.configurations.cpp = {
--   {
--     name = "Launch",
--     type = "gdb",
--     request = "launch",
--     program = function()
--       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     end,
--     cwd = "${workspaceFolder}",
--     stopAtBeginningOfMainSubprogram = false,
--   },
-- }

-- vim.fn.sign_define('DapBreakpoint', {text='', texthl='', linehl='', numhl=''})
-- vim.fn.sign_define('DapBreakpointCondition', {text='󰏄', texthl='', linehl='', numhl=''})
-- vim.fn.sign_define('DapBreakpointRejected', {text='󰅜', texthl='', linehl='', numhl=''})
-- vim.fn.sign_define('DapLogPoint', {text='', texthl='', linehl='', numhl=''})
