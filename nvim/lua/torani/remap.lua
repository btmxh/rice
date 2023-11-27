vim.g.mapleader = ","
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- vim.keymap.set("i", "jk", "<Esc>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ".. vim.fn.stdpath("config") .."/lua/torani/packer.lua<CR>");
vim.keymap.set("n", "<leader>vpe", "<cmd>e ".. vim.fn.stdpath("config") .."<CR>");
vim.keymap.set("n", "<leader>vps", "<cmd>e ".. vim.fn.stdpath("config") .."/snippets<CR>");

function ReloadConfig()
  for name,_ in pairs(package.loaded) do
    if name:match('^torani') and not name:match('nvim-tree') then
      package.loaded[name] = nil
    end
  end

  require('torani')
  local glob = vim.fn.stdpath('config') .. '/after/**/*.lua'
  for _, path in ipairs(vim.fn.glob(glob, true, true)) do
    dofile(path)
  end

  vim.notify("nvim configuration reloaded", vim.log.levels.INFO)
end

vim.keymap.set("n", "<leader>vpr", ReloadConfig);

vim.keymap.set("n", "<leader>ss", "<cmd>set spell<CR>")
vim.keymap.set("n", "<leader>nss", "<cmd>set nospell<CR>")
vim.keymap.set("n", "<leader>st", "zg")
vim.keymap.set("n", "<leader>sf", "z=")

vim.keymap.set("n", "<leader>te", "<cmd>TroubleToggle<CR>")
vim.keymap.set("n", "<leader>tr", "<cmd>Trouble<CR>")

vim.keymap.set("n", "<leader>ww", "<C-w><C-w>")
