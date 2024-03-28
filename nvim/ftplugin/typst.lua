vim.opt.wrap = true
vim.opt.textwidth = 80
vim.api.nvim_buf_set_keymap(0, "n", "<leader>ll", ":TypstWatch<CR>", { noremap = true, desc = "typst: Watch file" });
