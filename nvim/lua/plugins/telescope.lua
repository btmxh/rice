local trouble = require("trouble.providers.telescope")

return {
  'nvim-telescope/telescope.nvim',
  version = '0.1.6',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function(_, opts)
    require('telescope').setup(opts)
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>pf', builtin.find_files, {desc="telescope: Files"})
    vim.keymap.set('n', '<C-p>', builtin.git_files, {desc="telescope: Git files"})
    vim.keymap.set('n', '<leader>ps', function()
      builtin.grep_string({ search = vim.fn.input('Grep > ') })
    end, {desc="telescope: Grep cwd"})
  end,
  opts = {
    defaults = {
      mappings = {
        i = { ["<C-T>"] = trouble.open_with_trouble },
        n = { ["<C-T>"] = trouble.open_with_trouble },
      }
    }
  }
}
