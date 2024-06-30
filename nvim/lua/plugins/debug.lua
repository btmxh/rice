return {
  'mfussenegger/nvim-dap',
  config = function()
    local dap = require('dap')
    local widgets = require('dap.ui.widgets')
    vim.keymap.set("n", "<leader>br", function() dap.repl.open() end, { desc = "dap: Open REPL" })
    vim.keymap.set("n", "<leader>bc", function() dap.continue() end, { desc = "dap: Continue" })
    vim.keymap.set("n", "<leader>bi", function() dap.step_into() end, { desc = "dap: Step into" })
    vim.keymap.set("n", "<leader>bo", function() dap.step_over() end, { desc = "dap: Step over" })
    vim.keymap.set("n", "<leader>bb", function() dap.toggle_breakpoint() end, { desc = "dap: Toggle breakpoint" })
    vim.keymap.set({ 'n', 'v' }, '<Leader>bh', function() widgets.hover() end, { desc = "dap: Hover" })
    vim.keymap.set({ 'n', 'v' }, '<Leader>bp', function() widgets.preview() end, { desc = "dap: Preview" })

    dap.adapters.gdb = {
      type = "executable",
      command = "gdb",
      args = { "-i", "dap" },
    }

    dap.configurations.c = { {
      name = "Launch",
      type = "gdb",
      request = "launch",
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = "${workspaceFolder}",
      stopAtBeginningOfMainSubprogram = false,
    } }

    dap.configurations.zig = dap.configurations.c;
  end
}
