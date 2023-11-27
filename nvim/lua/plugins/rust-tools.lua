return {
  'simrat39/rust-tools.nvim',
  dependencies = {
    'VonHeikemen/lsp-zero.nvim'
  },
  config = function ()
    local lsp = require 'lsp-zero'
    local rust_lsp = lsp.build_options('rust_analyzer', {
      single_file_support = false,
      settings = {
          -- to enable rust-analyzer settings visit:
          -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
          ["rust-analyzer"] = {
          -- enable clippy on save
          checkOnSave = {
              command = "clippy"
          },
          }
      }
    })
    require('rust-tools').setup({ server = rust_lsp })
  end
}
