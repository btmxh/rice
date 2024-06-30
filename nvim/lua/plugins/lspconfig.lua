return {
  'neovim/nvim-lspconfig',
  lazy = false,
  config = function()
    local lsp = require('lspconfig')
    lsp.clangd.setup {}
    lsp.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = {
              'vim'
            }
          },
          workspace = {
            library = {
              vim.env.VIMRUNTIME,
            }
          }
        }
      }
    }
    lsp.denols.setup {
      root_dir = lsp.util.root_pattern("deno.json", "deno.jsonc"),
    }
    lsp.tsserver.setup {
      root_dir = lsp.util.root_pattern("package.json"),
      single_file_support = false,
    }
    lsp.eslint.setup {}
    lsp.typst_lsp.setup {
      settings = {
        exportPdf = "onType",
        experimentalFormatterMode = "on",
      }
    }
  end
}
