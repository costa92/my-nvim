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

-- 智能的水平分割窗口命令
vim.keymap.set('n', 'so', function()
  -- 获取当前缓冲区的信息
  local buftype = vim.bo.buftype
  local filetype = vim.bo.filetype
  local modifiable = vim.bo.modifiable
  
  -- 检查是否是特殊缓冲区
  if not modifiable or buftype ~= "" or filetype == "NvimTree" or filetype == "help" then
    -- 在特殊缓冲区中，先切换到上一个窗口，然后执行分割
    vim.cmd("wincmd p")
    vim.cmd("split")
  else
    -- 在普通缓冲区中，直接执行分割
    vim.cmd("split")
  end
end, { noremap = true, silent = true })

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

-- Buffer 管理快捷键
-- 列出所有 buffer
vim.keymap.set('n', '<Leader>bl', ':buffers<CR>', { noremap = true, silent = true })
-- 切换到下一个 buffer
vim.keymap.set('n', '<Leader>bn', ':bnext<CR>', { noremap = true, silent = true })
-- 切换到上一个 buffer
vim.keymap.set('n', '<Leader>bp', ':bprevious<CR>', { noremap = true, silent = true })
-- 关闭当前 buffer
vim.keymap.set('n', '<Leader>bd', ':bdelete<CR>', { noremap = true, silent = true })
-- 切换到指定编号的 buffer（输入编号后回车）
vim.keymap.set('n', '<Leader>bb', ':buffer ', { noremap = true })
-- 切换到最近使用的 buffer
vim.keymap.set('n', '<Leader>b<Leader>', ':b#<CR>', { noremap = true, silent = true })

-- nvimTree
-- Alt + hjkl 窗口间切换窗口

-- Alt + m  
-- map('n', '<A-m>', ':NvimTreeToggle<CR>', opts) 

-- -- Ctrl + W 关闭当前 buffer
-- map("n", "<C-w>", ":bd<CR>", { noremap = true, silent = true })

-- Alt+s 水平分割窗口
vim.keymap.set('n', '<A-s>', ':split<CR>', { noremap = true, silent = true })
-- Alt+v 垂直分割窗口
vim.keymap.set('n', '<A-v>', ':vsplit<CR>', { noremap = true, silent = true })
-- Alt+q 关闭当前窗口
vim.keymap.set('n', '<A-q>', ':close<CR>', { noremap = true, silent = true })
-- Alt+o 关闭其他窗口
vim.keymap.set('n', '<A-o>', ':only<CR>', { noremap = true, silent = true })

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



-- 使用 vo 键用于垂直分割窗口
vim.keymap.set('n', 'vo', ':vsplit<CR>', { noremap = true, silent = true })

-- 在新标签页中打开 buffer
vim.keymap.set('n', '<Leader>tn', ':tabnew<CR>', { noremap = true, silent = true })
-- 切换到下一个标签页
vim.keymap.set('n', '<Leader>tl', ':tabnext<CR>', { noremap = true, silent = true })
-- 切换到上一个标签页
vim.keymap.set('n', '<Leader>th', ':tabprevious<CR>', { noremap = true, silent = true })

-- 在 NvimTree 中使用特定的快捷键进行分割
vim.api.nvim_create_autocmd("FileType", {
  pattern = "NvimTree",
  callback = function()
    vim.keymap.set('n', 'sh', "<C-w>p:split<CR>", { buffer = true, noremap = true, silent = true })
    vim.keymap.set('n', 'sv', "<C-w>p:vsplit<CR>", { buffer = true, noremap = true, silent = true })
  end
})

-- 创建一个等待第二个键的函数
local split_mode = false
local split_timer = nil

vim.keymap.set('n', 's', function()
  split_mode = true
  -- 显示提示
  vim.api.nvim_echo({{"Split mode: [h]orizontal, [v]ertical, [c]lose, [o]nly", "WarningMsg"}}, false, {})
  
  -- 设置超时
  if split_timer then
    vim.fn.timer_stop(split_timer)
  end
  
  split_timer = vim.fn.timer_start(1000, function()
    split_mode = false
    vim.api.nvim_echo({{"", ""}}, false, {})
  end)
  
  -- 等待下一个键
  local char = vim.fn.getcharstr()
  
  if char == 'h' then
    vim.cmd('split')
  elseif char == 'v' then
    vim.cmd('vsplit')
  elseif char == 'c' then
    vim.cmd('close')
  elseif char == 'o' then
    vim.cmd('only')
  else
    -- 如果按下的不是预期的键，执行原始的 s 命令
    vim.api.nvim_feedkeys('s', 'n', false)
  end
  
  split_mode = false
  vim.api.nvim_echo({{"", ""}}, false, {})
end, { noremap = true, silent = true })
