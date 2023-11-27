return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    'williamboman/mason.nvim',
    'VonHeikemen/lsp-zero.nvim'
  },
  config = function()
    local lsp = require('lsp-zero')
    require('mason-lspconfig').setup({
      ensure_installed = {
        'tsserver',
        'eslint',
        'lua_ls',
        'rust_analyzer',
      },
      handlers = {
        lsp.default_setup,
        rust_analyzer = lsp.noop
      }
    })
  end
}
