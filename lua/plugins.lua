-- Install Packer automatically if it's not installed(Bootstraping)
-- Hint: string concatenation is done by `..`
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()


-- Reload configurations if we modify plugins.lua
-- Hint
--     <afile> - replaced with the filename of the buffer being manipulated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])


-- Install plugins here - `use ...`
-- Packer.nvim hints
--     after = string or list,           -- Specifies plugins to load before this plugin. See "sequencing" below
--     config = string or function,      -- Specifies code to run after this plugin is loaded
--     requires = string or list,        -- Specifies plugin dependencies. See "dependencies".
--     ft = string or list,              -- Specifies filetypes which load this plugin.
--     run = string, function, or table, -- Specify operations to be run after successful installs/updates of a plugin
return require('packer').startup(function(use)
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'

        ---------------------------------------
        -- NOTE: PUT YOUR THIRD PLUGIN HERE --
        ---------------------------------------
        use { "ellisonleao/gruvbox.nvim" }
        use 'luisiacc/the-matrix.nvim'
        use 'vim-airline/vim-airline'
        use 'vim-airline/vim-airline-themes'
        use {
            'nvim-tree/nvim-tree.lua',
            requires = {
                'nvim-tree/nvim-web-devicons', -- optional
            },
        }
        use {
            'nvim-treesitter/nvim-treesitter',
            run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
            end,
       }
        use {'neoclide/coc.nvim', branch = 'release'}
        use 'voldikss/vim-floaterm'
        use 'jiangmiao/auto-pairs'
        -- use({
        --    "iamcco/markdown-preview.nvim",
        --    run = function() vim.fn["mkdp#util#install"]() end,
        -- })
        use 'fatih/vim-go'
        use 'mhinz/vim-startify'
        -- use 'github/copilot.vim'
        use 'lukas-reineke/indent-blankline.nvim'

        use {
            'hrsh7th/nvim-cmp',
            requires = {
                'hrsh7th/cmp-cmdline',
                'hrsh7th/cmp-nvim-lsp',
            },
            config = function()
                local cmp = require('cmp')
                cmp.setup({
                    mapping = {
                        ['<CR>'] = cmp.mapping.confirm({ select = true }),
                        ['<Tab>'] = cmp.mapping(function(fallback)
                            if cmp.visible() then
                                cmp.select_next_item()
                            else
                                fallback()
                            end
                        end, { 'i', 's' }),
                        ['<S-Tab>'] = cmp.mapping(function(fallback)
                            if cmp.visible() then
                                cmp.select_prev_item()
                            else
                                fallback()
                            end
                        end, { 'i', 's' }),
                    },
                    sources = {
                        { name = 'nvim_lsp' },
                        { name = 'buffer' },
                        { name = 'path' },
                    },
                })
                
                cmp.setup.cmdline(':', {
                    mapping = cmp.mapping.preset.cmdline(),
                    sources = {
                        { name = 'cmdline' }
                    }
                })
            end
        }
        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if packer_bootstrap then
            require('packer').sync()
        end
    end)
