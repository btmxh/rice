return {
  'rafamadriz/friendly-snippets',

  {
    "windwp/nvim-autopairs",
    lazy = false,
    config = function() require("nvim-autopairs").setup {} end
  },

  'mfussenegger/nvim-dap',

  'folke/trouble.nvim',
  'nvim-tree/nvim-web-devicons',

  {
    'tummetott/reticle.nvim',
    config = function()
      require('reticle').setup {}
    end
  },


  {
    'iurimateus/luasnip-latex-snippets.nvim',
    config = function()
      require('luasnip-latex-snippets').setup()
    end,
  },

  'rlue/vim-barbaric',
  {
    'kevinhwang91/nvim-ufo',
    dependencies = {
      'kevinhwang91/promise-async',
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
      }
      local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
      for _, ls in ipairs(language_servers) do
        require('lspconfig')[ls].setup({
          capabilities = capabilities
          -- you can add other fields for setting up lsp server in this table
        })
      end

      require('ufo').setup()
    end
  },

  'tpope/vim-commentary'
}
