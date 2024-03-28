vim.opt.wrap = true
vim.opt.textwidth = 80

local keys = { 'j', 'k', '0', '$' }
local modes = { "n", "v" }
for _, key in pairs(keys) do
  for _, mode in pairs(modes) do
    vim.api.nvim_buf_set_keymap(0, mode, key, "g" .. key, { noremap = true });
    vim.api.nvim_buf_set_keymap(0, mode, "g" .. key, key, { noremap = true });
  end
end

local function parent(p)
  return p:sub(1, p:find("/[^/]*$") - 1)
end

vim.keymap.set("n", "<leader>qqq", function()
  local timestamp = tostring(os.time())
  local path = vim.fn.getcwd()
  local line = vim.api.nvim_buf_get_lines(0, 0, 1, true)[1]
  if line:find('^%%! TEX root = ') ~= nil then
    line = line:sub(('%! TEX root = '):len() + 1)
    line = line:match '^%s*(.*%S)' or ''
    path = path .. '/' .. parent(line)
  end
  path = path .. "/figures/" .. timestamp .. ".pdf"
  vim.fn.jobstart("ipe " .. path, { detach = true })
  local row, col = table.unpack(vim.api.nvim_win_get_cursor(0))
  local text = "\\includegraphics[scale=0.5]{figures/" .. timestamp .. "}"
  vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { text })
end, { noremap = true, buffer = true, desc = "tex: New figure" })
