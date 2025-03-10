-- define common options

-- 先定义 Leader 键
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 下面才开始设置快捷键
local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

-- =====================
-- 基本编辑操作
-- =====================

-- 保存文件
map("n", "<C-s>", ":w<CR>", opts)
map("i", "<C-s>", "<Esc>:w<CR>a", opts)

-- 复制粘贴（与系统剪贴板交互）
map('v', '<C-c>', '"+y', opts)
map('n', '<C-v>', '"*p', opts)  

-- 使用 <Leader>v 进入块可视模式
map('n', '<Leader>v', '<C-v>', opts)

-- 撤销/重做
-- u 撤销你刚才做的动作
-- ctrl+r 是恢复你刚才撤销的动作

-- =====================
-- 窗口管理
-- =====================

-- 窗口分割（使用 so/vo 风格）
vim.keymap.set('n', 'so', ':split<CR>', opts)
vim.keymap.set('n', 'vo', ':vsplit<CR>', opts)
vim.keymap.set('n', 'sc', ':close<CR>', opts)  -- split close
vim.keymap.set('n', 'so!', ':only<CR>', opts)  -- split only (关闭其他窗口)

-- 窗口导航（使用 Alt 键风格）
vim.keymap.set('n', '<A-h>', '<C-w>h', opts)
vim.keymap.set('n', '<A-j>', '<C-w>j', opts)
vim.keymap.set('n', '<A-k>', '<C-w>k', opts)
vim.keymap.set('n', '<A-l>', '<C-w>l', opts)
vim.keymap.set('n', '<A-w>', '<C-w>w', opts)  -- 循环切换到下一个窗口
vim.keymap.set('n', '<A-W>', '<C-w>W', opts)  -- 循环切换到上一个窗口

-- 调整窗口大小
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- =====================
-- 标签页管理
-- =====================
 
map('n', '<F5>', '<Esc>:tabnew<CR>', opts)

-- =====================
-- 插件快捷键
-- =====================

-- NvimTree
map('n', '<Leader>t', ':NvimTreeToggle<CR>', opts)
map('n', '<Leader>tf', '<Esc>:NvimTreeFindFile<CR>', opts)

-- Floaterm
map('n', '<Leader>te', '<Esc>:FloatermToggle<CR>', opts)

-- Coc
map('n', '<Leader>g', '<Esc>:CocCommand git.showBlameDoc<CR>', opts)



-- u 撤销你刚才做的动作
-- ctrl+r 是恢复你刚才撤销的动作

-- nvimTree
-- Alt + hjkl 窗口间切换窗口

-- Alt + m  
-- map('n', '<A-m>', ':NvimTreeToggle<CR>', opts) 


-- -- Ctrl + W 关闭当前 buffer
-- map("n", "<C-w>", ":bd<CR>", { noremap = true, silent = true })


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


-- 使用 so 和 vo 键来进行窗口分割
-- so 键用于水平分割窗口
vim.keymap.set('n', 'so', ':split<CR>', { noremap = true, silent = true })
-- vo 键用于垂直分割窗口
vim.keymap.set('n', 'vo', ':vsplit<CR>', { noremap = true, silent = true })


-- 窗口导航（使用 Ctrl 组合键）
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })


-- 调整窗口大小
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { noremap = true, silent = true })
