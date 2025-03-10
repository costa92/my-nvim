-- define common options

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


-- =====================
-- Buffer 管理快捷键
-- =====================
vim.keymap.set("n", "<Leader>bl", ":buffers<CR>", opts)
vim.keymap.set("n", "<Leader>bn", ":bnext<CR>", opts)
vim.keymap.set("n", "<Leader>bp", ":bprevious<CR>", opts)
vim.keymap.set("n", "<Leader>bd", ":bdelete<CR>", opts)
vim.keymap.set("n", "<Leader>bb", ":buffer ", { noremap = true })
vim.keymap.set("n", "<Leader>b<Leader>", ":b#<CR>", opts)

-- =====================
-- 窗口分割相关快捷键
-- =====================
-- 水平分割窗口：使用 "ss"
vim.keymap.set("n", "ss", ":split<CR>", opts)
-- 垂直分割窗口：使用 "sv"
vim.keymap.set("n", "sv", ":vsplit<CR>", opts)
-- 关闭当前窗口：使用 "sc"
vim.keymap.set("n", "sc", ":close<CR>", opts)
-- 关闭其他窗口：使用 "so"
vim.keymap.set("n", "so", ":only<CR>", opts)

-- 在分割窗口中打开 buffer 或文件
vim.keymap.set("n", "sb", ":split | buffer ", { noremap = true })
vim.keymap.set("n", "vb", ":vsplit | buffer ", { noremap = true })
vim.keymap.set("n", "sf", ":split ", { noremap = true })
vim.keymap.set("n", "vf", ":vsplit ", { noremap = true })


-- 全局 s 键映射，举例：将 s 映射为删除当前行（仅在可修改 buffer 中生效）
-- vim.api.nvim_set_keymap("n", "s", "dd", { noremap = true, silent = true })

-- 对于不可修改的 buffer（如 NvimTree、help 等），禁用 s 键
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "NvimTree", "help", "terminal" },
  callback = function()
    vim.keymap.set("n", "s", "<Nop>", { buffer = true })
  end,
})


-- 运行当前Go文件
vim.keymap.set('n', '<Leader>gr', ':GoRun<CR>', opts)
-- 测试当前Go包
vim.keymap.set('n', '<Leader>gt', ':GoTest<CR>', opts)
-- 测试当前Go函数
vim.keymap.set('n', '<Leader>gtf', ':GoTestFunc<CR>', opts)
-- 构建当前Go包
vim.keymap.set('n', '<Leader>gb', ':GoBuild<CR>', opts)
-- 显示Go文档
vim.keymap.set('n', '<Leader>gd', ':GoDoc<CR>', opts)
-- 跳转到定义
vim.keymap.set('n', '<Leader>gdf', ':GoDef<CR>', opts)
-- 返回跳转前的位置
vim.keymap.set('n', '<Leader>gdb', ':GoDefPop<CR>', opts)
-- 重命名标识符
vim.keymap.set('n', '<Leader>grn', ':GoRename<CR>', opts)
-- 显示接口实现
vim.keymap.set('n', '<Leader>gi', ':GoImplements<CR>', opts)
-- 显示调用者
vim.keymap.set('n', '<Leader>gc', ':GoCallers<CR>', opts)
-- 显示被调用者
vim.keymap.set('n', '<Leader>gce', ':GoCallees<CR>', opts)
-- 添加/移除标签
vim.keymap.set('n', '<Leader>gat', ':GoAddTags<CR>', opts)
-- 移除标签
vim.keymap.set('n', '<Leader>grt', ':GoRemoveTags<CR>', opts)
-- 填充结构体
vim.keymap.set('n', '<Leader>gfs', ':GoFillStruct<CR>', opts)
