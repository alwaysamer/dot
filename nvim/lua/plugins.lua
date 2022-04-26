local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
Plug('vim-scripts/delimitMate.vim')
Plug('nvim-lua/plenary.nvim')
Plug('BurntSushi/ripgrep')
Plug('nvim-telescope/telescope.nvim')
Plug('airblade/vim-rooter')
Plug('EdenEast/nightfox.nvim')
Plug('kyazdani42/nvim-web-devicons')
Plug('kyazdani42/nvim-tree.lua')
Plug('neovim/nvim-lspconfig')
Plug('akinsho/bufferline.nvim', {tag='*'})
Plug('goolord/alpha-nvim')
Plug('yamatsum/nvim-cursorline')
Plug('williamboman/nvim-lsp-installer')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/cmp-vsnip')
Plug('hrsh7th/vim-vsnip')
Plug('hrsh7th/nvim-cmp')
Plug('folke/tokyonight.nvim', { branch='main' })
Plug('kevinhwang91/nvim-hlslens')
Plug('nvim-treesitter/nvim-treesitter', {['do']='TSUpdate'})
Plug 'kdheepak/lazygit.nvim'
vim.call('plug#end')

require('plugins.bufferline')
require('plugins.alpha')
require('plugins.lsp')
require('plugins.cmp')
require('plugins.nvim-tree')
require('plugins.nvim-treesitter')
