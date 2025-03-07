-- define common options

local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}
local map = vim.api.nvim_set_keymap

-- vim.g.mapleader = "\\"
vim.g.mapleader= "<Space>"
-- vim.g.maplocalleader = "\\"

map('n', '<leader>t', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>tf', '<Esc>:NvimTreeFindFile<CR>', opts)
map('n', '<F5>', '<Esc>:tabnew<CR>', opts)
map('n', '<leader>te', '<Esc>:FloatermToggle<CR>', opts)
map('n', '<leader>g', '<Esc>:CocCommand git.showBlameDoc<CR>', opts)
map('v', '<C-c>', '"+y', opts)
map('n', '<C-v>', '"*p', opts)


-- u 撤销你刚才做的动作
-- ctrl+r 是恢复你刚才撤销的动作

-- nvimTree
-- Alt + hjkl 窗口间切换窗口

-- Alt + m  
map('n', '<A-m>', ':NvimTreeToggle<CR>', opts) 
