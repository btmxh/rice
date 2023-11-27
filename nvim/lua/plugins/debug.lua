return {
  'mfussenegger/nvim-dap',
  build = function ()
    local dap = require('dap')
    local widgets = require('dap.ui.widgets')
    vim.keymap.set("n", "<leader>do", function() dap.repl.open() end)
    vim.keymap.set("n", "<leader>cc", function() dap.continue() end)
    vim.keymap.set("n", "<leader>si", function() dap.step_into() end)
    vim.keymap.set("n", "<leader>so", function() dap.step_over() end)
    vim.keymap.set("n", "<leader>bb", function() dap.toggle_breakpoint() end)
    vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function() widgets.hover() end)
    vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function() widgets.preview() end)    
  end
}
