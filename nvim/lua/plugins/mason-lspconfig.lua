return {
  'williamboman/mason-lspconfig.nvim',
  lazy = false,
  dependencies = {
    'williamboman/mason.nvim'
  },
  config = function()
    local nvim_lsp = require('lspconfig')
    local lsp_caps = require('cmp_nvim_lsp').default_capabilities()

    local function check_file_exists(path)
      return vim.fn.filereadable(path) == 1
    end
    local function is_deno()
      local cwd = vim.fn.getcwd()
      return check_file_exists(cwd .. "/deno.json")
    end
    require('mason-lspconfig').setup({
      ensure_installed = {
        'tsserver',
        'eslint',
        'lua_ls',
      },
      handlers = {
        function(server)
          nvim_lsp[server].setup({
            capabilities = lsp_caps,
            on_attach = function(client, bufnr)
              if client.server_capabilities.inlayHintProvider then
                vim.g.inlay_hints_visible = true
                vim.lsp.inlay_hint.enable(true, {bufnr = bufnr})
              else
                print("no inlay hints available")
              end
            end
          })
        end,
        ["lua_ls"] = function()
          nvim_lsp.lua_ls.setup({
            capabilities = lsp_caps,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { 'vim' }
                },
                workspace = {
                  library = {
                    vim.env.VIMRUNTIME,
                  }
                }
              }
            }
          })
        end,
        ["rust_analyzer"] = function()
          return true
        end,
        ["denols"] = function()
          if is_deno() then
            nvim_lsp.denols.setup {
              capabilities = lsp_caps
            }
          else
            return true
          end
        end,
        ["tsserver"] = function()
          if not is_deno() then
            nvim_lsp.tsserver.setup {
              capabilities = lsp_caps
            }
          else
            return true
          end
        end,
        ["typst_lsp"] = function()
          nvim_lsp.typst_lsp.setup {
            settings = {
              exportPdf = "onType",
              experimentalFormatterMode = "on",
            }
          }
        end
      }
    })
  end
}
