-- define common options

-- 先定义 Leader 键
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 下面才开始设置快捷键
local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap


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


-- Ctrl + S 保存
map("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
map("i", "<C-s>", "<Esc>:w<CR>a", { noremap = true, silent = true })


-- Ctrl + W 关闭当前 buffer
map("n", "<C-w>", ":bd<CR>", { noremap = true, silent = true })