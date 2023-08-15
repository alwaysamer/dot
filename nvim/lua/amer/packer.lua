local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
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
    use "numToStr/FTerm.nvim"
    use 'romgrk/barbar.nvim'
    use {
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
    }
    use {
        'lunarvim/horizon.nvim',
        config = function ()
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
        "nvim-neorg/neorg",
        run = ":Neorg sync-parsers",
    }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        requires = { {'nvim-lua/plenary.nvim'} }
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
        'nvim-tree/nvim-web-devicons', -- optional
      },
    }
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
            'williamboman/mason.nvim',
            run = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
    }
}

    if packer_bootstrap then
        require('packer').sync()
    end
end)
