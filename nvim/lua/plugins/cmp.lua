return {
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      local cmp_select = { behavior = cmp.SelectBehavior.Select }

      cmp.setup({
        sources = {
          { name = 'path' },
          { name = 'nvim_lsp' },
          { name = 'nvim_lua' },
          { name = 'buffer',  keyword_length = 3 },
          { name = 'luasnip', keyword_length = 2 },
        },
        mapping = cmp.mapping.preset.insert({
          -- confirm completion item
          ['<CR>'] = cmp.mapping.confirm({ select = false }),

          -- toggle completion menu
          ['<C-e>'] = cmp.mapping.close(),

          -- tab complete
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item(cmp_select)
            elseif luasnip.locally_jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),

          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item(cmp_select)
            elseif luasnip.locally_jumpable(-1) then
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
            require('luasnip').lsp_expand(args.body)
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
  }
}
