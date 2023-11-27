return {
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
      'hrsh7th/nvim-cmp'
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

  'rlue/vim-barbaric'
}
