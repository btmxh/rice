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
      local ls = require("luasnip")

      ls.add_snippets("markdown", { ls.parser.parse_snippet(
        { trig = "mk", name = "Math", priority = 10 },
        "\\( ${1:${TM_SELECTED_TEXT}} \\)$0"
      ) }, {
        type = "autosnippets",
      })

      ls.add_snippets("markdown", { ls.parser.parse_snippet(
        { trig = "dm", name = "Math", priority = 10 },
        "\\[ ${1:${TM_SELECTED_TEXT}} \\]$0"
      ) }, {
        type = "autosnippets",
      })
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

  'tpope/vim-commentary',
  -- 'github/copilot.vim'
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup({
        enable_cmp_source = false,
        virtual_text = {
          enabled = true
        }
      })
    end
  },
}
