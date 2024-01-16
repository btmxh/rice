return {
  {
    'hrsh7th/nvim-cmp',
    config = function()
      require 'cmp'.setup {
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end
        },

        sources = {
          { name = 'luasnip' }
        }
      }
    end
  },
  {
    'hrsh7th/cmp-nvim-lsp',
    dependencies = {
      'hrsh7th/nvim-cmp'
    }
  },
  {
    'hrsh7th/cmp-nvim-lua',
    dependencies = {
      'hrsh7th/nvim-cmp'
    }
  },
  {
    'hrsh7th/cmp-buffer',
    dependencies = {
      'hrsh7th/nvim-cmp'
    }
  },
  {
    'hrsh7th/cmp-path',
    dependencies = {
      'hrsh7th/nvim-cmp'
    }
  },
  {
    'saadparwaiz1/cmp_luasnip',
    dependencies = {
      'hrsh7th/nvim-cmp',
    }
  },

  'rafamadriz/friendly-snippets',

  {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  },

  -- Debugging
  'nvim-lua/plenary.nvim',
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
