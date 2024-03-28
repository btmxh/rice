return {
  'mrcjkb/rustaceanvim',
  version = '^3',
  ft = 'rust',
  opts = {
    server = {
      on_attach = function(client, bufnr)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>RustLsp codeAction<CR>",
          { desc = "rustaceanvim: Code actions" })
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>dr", "<cmd>RustLsp debuggables<CR>",
          { desc = "rustaceanvim: Debuggables" })
      end,
      settings = {
        -- rust-analyzer language server configuration
        ["rust-analyzer"] = {
          cargo = {
            allFeatures = true,
            loadOutDirsFromCheck = true,
            runBuildScripts = true,
          },
          -- Add clippy lints for Rust.
          checkOnSave = {
            allFeatures = true,
            command = "clippy",
            extraArgs = { "--no-deps" },
          },
          procMacro = {
            enable = true,
            ignored = {
              ["async-trait"] = { "async_trait" },
              ["napi-derive"] = { "napi" },
              ["async-recursion"] = { "async_recursion" },
            },
          },
        },
      }
    }
  },
  config = function(_, opts)
    vim.g.rustaceanvim = vim.tbl_deep_extend("force",
      {},
      opts or {})
  end
}
