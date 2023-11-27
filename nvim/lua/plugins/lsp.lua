return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' },             -- Required
    { 'williamboman/mason.nvim' },           -- Optional
    { 'williamboman/mason-lspconfig.nvim' }, -- Optional

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },     -- Required
    { 'hrsh7th/cmp-nvim-lsp' }, -- Required
  },
  config = function ()
    local lsp = require 'lsp-zero'
    lsp.preset('recommended')

    require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

    local cmp = require 'cmp'
    local cmp_action = lsp.cmp_action()

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
        ['<C-e>'] = cmp_action.toggle_completion(),

        -- tab complete
        ['<Tab>'] = cmp_action.tab_complete(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),

        -- navigate between snippet placeholder
        ['<C-n>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),

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
      formatting = lsp.cmp_format()
    })

    lsp.on_attach(function(client, bufnr)
      local opts = { buffer = bufnr, remap = false }
      vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
      vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
      vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
      vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
      vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
      vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
      vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
      vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
      vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
      vim.keymap.set('n', '<C-_>', function() vim.lsp.buf.signature_help() end, opts)
      vim.keymap.set('i', '<C-_>', function() vim.lsp.buf.signature_help() end, opts)
    end)

    lsp.set_sign_icons({
      error = '✘',
      warn = '▲',
      hint = '⚑',
      info = ''
    })

    vim.diagnostic.config({
      virtual_text = true,
      severity_sort = true,
      float = {
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
      },
    })

    lsp.setup()
  end
}
