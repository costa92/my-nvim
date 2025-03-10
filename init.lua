-- 先定义 Leader 键
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- 增加键映射超时时间
vim.opt.timeoutlen = 1000

require('options')
require('keymaps')
require('plugins')
require('colorscheme')
require("nvim-tree").setup()
require('options-plugins')

vim.schedule(function()
    vim.g.mapleader = " "
end)

