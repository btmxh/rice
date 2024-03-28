return {
  'folke/trouble.nvim',
  config = function()
    vim.keymap.set("n", "<C-k>", function() require("trouble").next({ skip_groups = true, jump = true }) end)
    vim.keymap.set("n", "<C-j>", function() require("trouble").previous({ skip_groups = true, jump = true }) end)
    vim.keymap.set("n", "<leader>t", "<cmd>TroubleToggle<CR>", {desc="trouble: Toggle"})
  end
}
