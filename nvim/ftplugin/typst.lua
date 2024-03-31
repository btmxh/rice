vim.opt.wrap = true
vim.opt.textwidth = 80
-- vim.api.nvim_buf_set_keymap(0, "n", "<leader>ll", ":TypstWatch<CR>", { noremap = true, desc = "typst: Watch file" });
vim.api.nvim_buf_set_keymap(0, "n", "<leader>ll", "<cmd>!xdg-open %:p:r.pdf &<CR>", { noremap = true, desc = "typst: Open preview" });

