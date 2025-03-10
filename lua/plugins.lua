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
        use {
            "ellisonleao/gruvbox.nvim",
            priority = 1000
        }
        use {
            'luisiacc/the-matrix.nvim',
            requires = 'nvim-treesitter/nvim-treesitter'
        }
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
        use 'lukas-reineke/indent-blankline.nvim'
        -- use 'github/copilot.vim'
        -- require("ibl").setup()

        use {
            'hrsh7th/nvim-cmp',
            requires = {
                'hrsh7th/cmp-cmdline',
                'hrsh7th/cmp-nvim-lsp',
                'hrsh7th/cmp-buffer',
                'hrsh7th/cmp-path',
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
        use {
            'akinsho/bufferline.nvim',
            requires = 'nvim-tree/nvim-web-devicons',
            config = function()
                require("bufferline").setup{
                    options = {
                        numbers = "ordinal",
                        close_command = "bdelete! %d",
                        right_mouse_command = "bdelete! %d",
                        left_mouse_command = "buffer %d",
                        middle_mouse_command = nil,
                        indicator = {
                            icon = '▎',
                            style = 'icon',
                        },
                        buffer_close_icon = '',
                        modified_icon = '●',
                        close_icon = '',
                        left_trunc_marker = '',
                        right_trunc_marker = '',
                        max_name_length = 18,
                        max_prefix_length = 15,
                        tab_size = 18,
                        diagnostics = "nvim_lsp",
                        show_buffer_icons = true,
                        show_buffer_close_icons = true,
                        show_close_icon = true,
                        show_tab_indicators = true,
                        persist_buffer_sort = true,
                        separator_style = "thin",
                        enforce_regular_tabs = false,
                        always_show_bufferline = true,
                    }
                }
            end
        }
        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if packer_bootstrap then
            require('packer').sync()
        end
    end)
