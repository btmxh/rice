local function lazy_require_luasnip()
  if vim.tbl_get(require 'lazy.core.config', "plugins", "cmp_luasnip", "_", "loaded") then
    return require("luasnip")
  end

  return nil
end

return {
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require 'cmp'
      local cmp_select = { behavior = cmp.SelectBehavior.Select }

      cmp.setup({
        sources = {
          { name = 'path' },
          { name = 'nvim_lsp' },
          { name = 'nvim_lua' },
          { name = 'buffer',  keyword_length = 3 },
          -- { name = 'codeium' }
        },
        mapping = cmp.mapping.preset.insert({
          -- confirm completion item
          ['<CR>'] = cmp.mapping.confirm({ select = true }),

          -- toggle completion menu
          ['<C-e>'] = cmp.mapping.close(),

          -- tab complete
          ['<C-n>'] = cmp.mapping(function(fallback)
            local luasnip = lazy_require_luasnip()
            if cmp.visible() then
              cmp.select_next_item(cmp_select)
            elseif luasnip ~= nil and luasnip.locally_jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),

          ['<C-m>'] = cmp.mapping(function(fallback)
            local luasnip = lazy_require_luasnip()
            if cmp.visible() then
              cmp.select_prev_item(cmp_select)
            elseif luasnip ~= nil and luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),

          -- scroll documentation window
          ['<C-f>'] = cmp.mapping.scroll_docs(-5),
          ['<C-d>'] = cmp.mapping.scroll_docs(5),
        }),
        window = {
          documentation = cmp.config.window.bordered()
        },
        preselect = 'item',
        completion = {
          completeopt = 'menu,menuone,noinsert',
        },
        -- formatting = lsp.cmp_format(),
        snippet = {
          expand = function(args)
            local luasnip = lazy_require_luasnip()
            if luasnip ~= nil then
              luasnip.lsp_expand(args.body)
            else
              vim.snippet.expand(args.body)
            end
          end
        },
        view = {
          entries = {
            follow_cursor = true,
          }
        }
      })

      cmp.event:on('confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done())
    end
  },
  {
    'hrsh7th/cmp-nvim-lsp',
    lazy = false,
    config = true,
    dependencies = {
      'hrsh7th/nvim-cmp'
    }
  },
  {
    'hrsh7th/cmp-nvim-lua',
    ft = "lua",
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
    'L3MON4D3/LuaSnip',
    dependencies = {
      'rafamadriz/friendly-snippets'
    },
    lazy = true,
    config = function()
      require('luasnip').config.set_config({
        enable_autosnippets = true,
        snip_env = require('torani.tex_utils'),
      })
      require('luasnip.loaders.from_vscode').lazy_load()
      require('luasnip.loaders.from_lua').load({ paths = vim.fn.stdpath("config") .. "/snippets" })
    end,
  },
  {
    'saadparwaiz1/cmp_luasnip',
    dependencies = {
      'hrsh7th/nvim-cmp',
      'L3MON4D3/LuaSnip'
    },
    ft = "tex",
  }
}
