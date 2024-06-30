vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Oil, { desc = "oil: Open explorer" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", [["+P]], { desc = "Paste from Clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to Clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy line to Clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["+d]], { desc = "Cut to Clipboard" })

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "New tmux session" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format document" })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Quick replace" })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make executable" })

vim.keymap.set("n", "<leader>vps", "<cmd>e " .. vim.fn.stdpath("config") .. "/snippets<CR>", { desc = "Edit snippets" });

vim.keymap.set("n", "<leader>ss", "<cmd>set spell!<CR>", { desc = "spell: Toggle" })
vim.keymap.set("n", "<leader>st", "zg", { desc = "spell: Add word to dict" })
vim.keymap.set("n", "<leader>sf", "z=", { desc = "spell: Fix" })

vim.keymap.set("n", "<leader>ww", "<C-w><C-w>", { desc = "Go to next window" })
vim.keymap.set("n", "<leader>wh", "<C-w><C-h>", { desc = "Go to left window" })
vim.keymap.set("n", "<leader>wj", "<C-w><C-j>", { desc = "Go to down window" })
vim.keymap.set("n", "<leader>wk", "<C-w><C-k>", { desc = "Go to up window" })
vim.keymap.set("n", "<leader>wl", "<C-w><C-l>", { desc = "Go to right window" })

vim.keymap.set("n", "<leader>sh", "<cmd>split<CR>", { desc = "Open horizontal split" })
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Open vertical split" })
vim.keymap.set("n", "<leader>th", "<cmd>split<CR><cmd>term<CR>", { desc = "Open horizontal terminal split" })
vim.keymap.set("n", "<leader>tv", "<cmd>vsplit<CR><cmd>term<CR>", { desc = "Open vertical terminal split" })

vim.keymap.set("n", ";", ":")
vim.keymap.set("n", ";;", ";", { remap = true })

vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, { desc = "Open diagnostic" })
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, { desc = "Next diagnostic" })
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, { desc = "Prev diagnostic" })

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function(event)
    local function opts(desc)
      return { buffer = event.buf, remap = false, desc = desc }
    end
    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts("Go to definition"))
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts("Hover"))
    vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts("Workspace symbol"))
    vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts("Code action"))
    vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts("References"))
    vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts("Rename"))
    vim.keymap.set('n', '<C-_>', function() vim.lsp.buf.signature_help() end, opts("Signature help"))
  end
})

vim.api.nvim_set_keymap("n", "gx", [[:silent execute '!xdg-open ' . shellescape(expand('<cfile>'), 1)<CR>]],
  { desc = "Open link" })

vim.keymap.set("n", "<leader>il", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 })
end, { desc = "Toggle inlay hint" })

-- terminal related
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<leader>hh", "<cmd>ClangdSwitchSourceHeader<CR>", { desc = "Toggle header/source (C/C++)" })
