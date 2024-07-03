return {
  'neovim/nvim-lspconfig',
  lazy = false,
  dev = true,
  config = function()
    local lsp = require('lspconfig')
    local configs = {
      clangd = {},
      lua_ls = {
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
      },
      tsserver = {
        root_dir = lsp.util.root_pattern("package.json"),
        single_file_support = false,
      },
      eslint = {},
      typst_lsp = {
        settings = {
          exportPdf = "onType",
          experimentalFormatterMode = "on",
        },
      },
      texlab = {
      },
      lemminx = {},
    }

    for lsp_name, config in pairs(configs) do
      config = vim.tbl_deep_extend('keep', config, {
        capabilities = {
          textDocument = {
            foldingRange = {
              dynamicRegistration = false,
              lineFoldingOnly = true
            }
          }
        }
      })
      lsp[lsp_name].setup(config)
    end
  end
}
