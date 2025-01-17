-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}
local map = vim.api.nvim_set_keymap

-- vim.g.mapleader = "\\"
-- vim.g.maplocalleader = "\\"

map('n', '<leader>t', ':NvimTreeToggle', opts)
map('n', '<leader>tf', '<Esc>:NvimTreeFindFile<CR>', opts)
map('n', '<F5>', '<Esc>:tabnew<CR>', opts)
map('n', '<leader>te', '<Esc>:FloatermToggle<CR>', opts)
map('n', '<leader>g', '<Esc>:CocCommand git.showBlameDoc<CR>', opts)
map('v', '<C-c>', '"+y', opts)
map('n', '<C-v>', '"*p', opts)


-- u 撤销你刚才做的动作
-- ctrl+r 是恢复你刚才撤销的动作

--分屏的设置快捷键
vim.keymap.set('n', 'sl', ':set splitright<CR>:vsplit<CR>', {noremap=true, silent=true})
vim.keymap.set('n', 'sh', ':set nosplitright<CR>:vsplit<CR>', {noremap=true, silent=true})
vim.keymap.set('n', 'sk', ':set nosplitbelow<CR>:split<CR>', {noremap=true, silent=true})
vim.keymap.set('n', 'sj', ':set splitbelow<CR>:split<CR>', {noremap=true, silent=true})
