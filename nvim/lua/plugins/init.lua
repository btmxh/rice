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
    'btmxh/reticle.nvim',
    config = true,
    dev = true,
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
      'neovim/nvim-lspconfig'
    },
    config = true
  },

  'tpope/vim-commentary'
}
