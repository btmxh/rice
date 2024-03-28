return {
    'theprimeagen/harpoon',
    config = function ()
        local mark = require 'harpoon.mark'
        local ui = require 'harpoon.ui'
        
        vim.keymap.set('n', '<leader>a', mark.add_file, {desc="harpoon: Mark file"})
        vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu, {desc="harpoon: menu"})
        
        vim.keymap.set('n', '<C-j>', function() ui.nav_file(1) end, {desc="harpoon: Goto 1"})
        vim.keymap.set('n', '<C-k>', function() ui.nav_file(2) end, {desc="harpoon: Goto 2"})
        vim.keymap.set('n', '<C-l>', function() ui.nav_file(3) end, {desc="harpoon: Goto 3"})
    end
}
