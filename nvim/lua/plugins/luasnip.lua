return {
  'L3MON4D3/LuaSnip',
  config = function ()
    require('luasnip').config.set_config({
      enable_autosnippets = true,
      snip_env = require('torani.tex_utils'),
    })
    require('luasnip.loaders.from_vscode').lazy_load()
    require('luasnip.loaders.from_lua').load({ paths = vim.fn.stdpath("config") .. "/snippets" })
  end
}
