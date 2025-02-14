return {
  'neovim/nvim-lspconfig',
  lazy = false,
  config = function()
    local lsp = require('lspconfig')
    local configs = {
      clangd = {},
      basedpyright = {},
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
      ts_ls = {
        root_dir = lsp.util.root_pattern("package.json"),
        single_file_support = false,
      },
      eslint = {},
      tinymist = {
        settings = {
          exportPdf = 'onType',
          outputPath = '$root/target/$dir/$name',
          root_dir = "-",
          formatterMode = "typstyle",
        },
        root_dir = function()
          return vim.fn.getcwd()
        end
      },
      texlab = {
      },
      lemminx = {},
      glsl_analyzer = {},
      gopls = {},
      ruff = {},
      html = {},
      emmet_language_server = {},
      cssls = {},
      bashls = {},
      cmake = {},
      denols = {
        root_dir = lsp.util.root_pattern("deno.json", "deno.jsonc"),
      },
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
