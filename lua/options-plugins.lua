require'nvim-treesitter.configs'.setup {
  -- 安装 language parser
  -- :TSInstallInfo 命令查看支持的语言
  ensure_installed = {"vim", "lua", "javascript", "go", "c", "proto"},
  -- 启用代码高亮功能
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  -- 启用增量选择
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      node_decremental = '<BS>',
      scope_incremental = '<TAB>',
    }
  },
  -- 启用基于Treesitter的代码格式化(=) . NOTE: This is an experimental feature.
  indent = {
    enable = true
  }
}

-- 启用缩进线
require("ibl").setup()

-- 开启 Folding 功能
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.wo.foldlevel = 99

-- 禁用备份文件,避免某些LSP服务器的问题
vim.opt.backup = false
vim.opt.writebackup = false

-- 减少更新时间以提升用户体验(默认4000ms太长)
vim.opt.updatetime = 300

-- 始终显示符号列,避免诊断信息出现时发生文本偏移
vim.opt.signcolumn = "yes"

local keyset = vim.keymap.set

-- 检查光标前是否为空白字符
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- 使用Tab触发自动完成并导航
-- 注意:默认总是有一个completion item被选中,可以通过设置"suggest.noselect": true来禁用
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- 代码导航快捷键
keyset("n", "<c-]>", "<Plug>(coc-definition)", {silent = true})
keyset("n", "<c-t>", "<Plug>(coc-type-definition)", {silent = true})
keyset("n", "gi", "<Plug>(coc-implementation)", {silent = true})
keyset("n", "gr", "<Plug>(coc-references)", {silent = true})

-- 使用K显示文档预览窗口
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})

-- 代码片段相关快捷键
keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
keyset("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

-- GitHub Copilot配置
-- vim.cmd([[imap <silent><script><expr> <C-K> copilot#Accept("\<CR>")]])
-- vim.cmd([[let g:copilot_no_tab_map = v:true]])
-- vim.cmd([[ let g:copilot_filetypes = {
--                               \ '*': v:true,
--                               \ }
-- ]])

-- nvim-tree 
require'nvim-tree'.setup {
  -- 关闭文件时自动关闭
  auto_close = true,
  -- 显示 git 状态图标
  git = {
      enable = tree
  }
}