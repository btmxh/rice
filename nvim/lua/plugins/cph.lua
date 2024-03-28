return {
  {
    "btmxh/cphelper.nvim",
    config = function()
      vim.cmd [[let g:cph#dir = expand('$HOME/dev/contests')]]
      vim.cmd [[let g:cph#cpp#compile_command = 'g++ solution.cpp --std=c++20 -o cpp.out']]
      vim.cmd [[let g:cph#cpp#template_path = expand('$HOME/dev/contests/solution.cpp')]]
      vim.cmd [[let g:cph#cpp#language_id = 89]]
      vim.g["cph#cpp#transform"] = function(code)
        local transformed = ""
        for line in code:gmatch("[^\r\n]+") do
          local header = line:match("#include \"(.*)\" // TEMPLATE")
          if header ~= nil then
            local f = assert(io.open(header), "r")
            local content = f:read("*all")
            f:close()
            transformed = transformed .. content .. '\n'
          else
            transformed = transformed .. line .. '\n'
          end
        end
        return transformed
      end

      vim.keymap.set("n", "<leader>cpr", "<cmd>CphReceive<CR>", { desc = "cphelper: Receive" })
      vim.keymap.set("n", "<leader>cps", "<cmd>CphSubmit<CR>", { desc = "cphelper: Submit current file" })
      vim.keymap.set("n", "<leader>cpq", "<cmd>CphStop<CR>", { desc = "cphelper: Stop receive server" })
      vim.keymap.set("n", "<leader>cpd", ":CphDelete", { desc = "cphelper: Delete" })
      vim.keymap.set("n", "<leader>cpe", ":CphEdit", { desc = "cphelper: Edit test" })
      vim.keymap.set("n", "<leader>cpt", "<cmd>CphTest<CR>", { desc = "cphelper: Run tests" })
      vim.keymap.set("n", "<leader>cpy", "<cmd>CphRetest<CR>", { desc = "cphelper: Rerun tests" })
    end,
  }
}
