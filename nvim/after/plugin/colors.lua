require('onedark').setup {
	transparent = true,
	lualine = {
		transparent = true,
	},
}

vim.api.nvim_command('autocmd ColorScheme * highlight Normal ctermbg=None guibg=None')
vim.cmd.colorscheme('onedark')

