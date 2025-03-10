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
-- map('n', '<A-m>', ':NvimTreeToggle<CR>', opts) 


-- Ctrl + S 保存
map("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
map("i", "<C-s>", "<Esc>:w<CR>a", { noremap = true, silent = true })


-- Ctrl + W 关闭当前 buffer
map("n", "<C-w>", ":bd<CR>", { noremap = true, silent = true })


-- 将窗口导航快捷键从 Ctrl+w 修改为 Alt
-- Alt+w 循环切换到下一个窗口
vim.keymap.set('n', '<A-w>', '<C-w>w', { noremap = true, silent = true })
-- Alt+W 循环切换到上一个窗口
vim.keymap.set('n', '<A-W>', '<C-w>W', { noremap = true, silent = true })
-- Alt+h 移动到左侧窗口
vim.keymap.set('n', '<A-h>', '<C-w>h', { noremap = true, silent = true })
-- Alt+j 移动到下方窗口
vim.keymap.set('n', '<A-j>', '<C-w>j', { noremap = true, silent = true })
-- Alt+k 移动到上方窗口
vim.keymap.set('n', '<A-k>', '<C-w>k', { noremap = true, silent = true })
-- Alt+l 移动到右侧窗口
vim.keymap.set('n', '<A-l>', '<C-w>l', { noremap = true, silent = true })

-- Alt+s 水平分割窗口
vim.keymap.set('n', '<A-s>', ':split<CR>', { noremap = true, silent = true })
-- Alt+v 垂直分割窗口
vim.keymap.set('n', '<A-v>', ':vsplit<CR>', { noremap = true, silent = true })
-- Alt+q 关闭当前窗口
vim.keymap.set('n', '<A-q>', ':close<CR>', { noremap = true, silent = true })
-- Alt+o 关闭其他窗口
vim.keymap.set('n', '<A-o>', ':only<CR>', { noremap = true, silent = true })