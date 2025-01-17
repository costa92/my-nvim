-- Hint: use `:h <option>` to figure out the meaning if needed
vim.opt.clipboard = 'unnamedplus' -- use system clipboard
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.mouse = 'a' -- allow the mouse to be used in Nvim

-- Tab
vim.opt.tabstop = 4 -- number of visual spaces per TAB
vim.opt.softtabstop = 4 -- number of spacesin tab when editing
vim.opt.shiftwidth = 4 -- insert 4 spaces on a tab
vim.opt.expandtab = true -- tabs are spaces, mainly because of python

-- UI config
vim.opt.number = true -- show absolute number
vim.wo.relativenumber = false  -- show relative number
vim.opt.cursorline = true -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true -- open new vertical split bottom
vim.opt.splitright = true -- open new horizontal splits right
vim.opt.termguicolors = true        -- enabl 24-bit RGB color in the TUI
vim.opt.showmode = true -- we are experienced, wo don't need the "-- INSERT --" mode hint
vim.opt.laststatus = 2 -- 总是显示状态栏
vim.opt.ruler = true -- 显示光标位置（行号、列号）
vim.opt.scrolloff = 5 -- 光标距离顶部/底部的最小行数
vim.opt.guifont = "FiraCode Nerd Font:h12" 

-- Searching
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true -- but make it case sensitive if an uppercase is entered
vim.opt.wildmode = "longest:full,full" -- 优化补全行为
vim.opt.incsearch = true -- 增量搜索（输入时实时匹配）
vim.opt.hlsearch = true -- 高亮显示搜索结果
vim.opt.ignorecase = true -- 搜索时忽略大小写
vim.opt.smartcase = true -- 如果搜索模式包含大写字母，则区分大小写
vim.opt.showmatch = true -- 高亮显示匹配的括号

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


--编码相关
vim.opt.encoding="utf-8"  -- 默认编码为 UTF-8
vim.opt.fileencoding="utf-8" -- 文件保存时的编码为 UTF-8
vim.opt.fileencodings="ucs-bom,utf-8,cp936,latin1,gb18030,gbk,gb2312,chinese" -- 文件编码探测顺序
vim.opt.fileformats="unix,dos" -- 文件换行符格式（Unix 和 DOS）

--其他配置
vim.cmd('filetype plugin on') -- 启用文件类型检测和插件
vim.opt.syntax = "on" -- 启用语法高亮
vim.opt.timeoutlen=130 -- 快捷键超时时间（毫秒）
vim.opt.list = true -- 显示不可见字符（如 Tab、空格）
vim.opt.wrap = true -- 自动换行
vim.opt.mouse="" --禁用鼠标支持
vim.opt.linebreak = true -- 在单词边界换行
vim.opt.compatible = false -- 禁用 Vi 兼容模式
vim.opt.backspace = "indent,eol,start" -- 允许退格键删除缩进、换行符和插入模式前的字符
vim.opt.endofline = false -- 不自动添加换行符
vim.opt.listchars = {
  tab = '│ ', -- 用 │ 表示 Tab
  trail = '·', -- 用 · 表示行尾空格
  extends = '›', -- 用 › 表示超出屏幕的文本
  precedes = '‹', -- 用 ‹ 表示超出屏幕的文本
  nbsp = '␣', -- 用 ␣ 表示非断行空格
}

vim.opt.cursorline = true -- 启用光标所在行高亮
vim.opt.cursorcolumn = true -- 启用光标所在列高亮
vim.opt.termguicolors = true --启用真彩色


vim.cmd([[
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
]])
