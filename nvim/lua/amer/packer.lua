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

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerCompile
  augroup end
]])

local packer_bootstrap = ensure_packer()
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'nvim-tree/nvim-web-devicons'
    use 'lewis6991/gitsigns.nvim'
    use 'romgrk/barbar.nvim'
    use 'github/copilot.vim'
    use "windwp/nvim-autopairs"
    use {
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
    }

    use {
        'lunarvim/horizon.nvim',
        config = function()
            vim.cmd('colorscheme horizon')
        end
    }
    use {
        "ahmedkhalf/project.nvim",
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    use('mbbill/undotree')
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
    }
    use 'NeoGitOrg/neogit'
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            { 'neovim/nvim-lspconfig' },
            {
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' },

            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }
    use 'mrjones2014/legendary.nvim'
    use {'stevearc/dressing.nvim'}
    use{
        "epwalsh/obsidian.nvim",
        tag = "*",
        requires = {
            "nvim-lua/plenary.nvim",
        },
    }
    use{
        "folke/todo-comments.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
    }
    use({
         "epwalsh/pomo.nvim",
         tag = "*",
         requires = {
            "rcarriga/nvim-notify",
        },
    })

    use({
         "folke/noice.nvim",
         requires = {
            "rcarriga/nvim-notify",
            "MunifTanjim/nui.nvim"
        },
    })
    use "numToStr/Comment.nvim"
    use "lukas-reineke/indent-blankline.nvim"
    use "otavioschwanck/arrow.nvim"
    if packer_bootstrap then
        require('packer').sync()
    end
end)
