return {
  {
    "btmxh/cphelper.nvim",
    dev = true,
    config = function()
      vim.cmd [[let g:cph#dir = expand('$HOME/dev/contests')]]
      vim.cmd [[let g:cph#cpp#compile_command = 'g++ solution.cpp --std=c++20 -o cpp.out']]
      vim.cmd [[let g:cph#cpp#template_path = expand('$HOME/dev/contests/solution.cpp')]]
      vim.cmd [[let g:cph#cpp#language_id = 89]]
      vim.g["cph#cpp#transform"] = function(code, accept)
        local job = vim.system({"cptpp", "-"}, {
          stdin = code,
          text = true
        })
        vim.schedule(function() accept(job:wait().stdout) end)
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
