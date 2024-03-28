return {
  {
    "btmxh/cphelper.nvim",
    config = function ()
      vim.cmd [[let g:cph#dir = '/home/torani/dev/contests']]
      vim.cmd [[let g:cph#cpp#compile_command = 'g++ solution.cpp --std=c++20 -o cpp.out']]
      vim.cmd [[command CphCopy w !python /home/torani/dev/contests/copy.py | xclip -sel clip ]]
      vim.cmd [[let g:cph#cpp#template_path = '/home/torani/dev/contests/solution.cpp']]
    end
  }
}
