vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
use 'wbthomason/packer.nvim'

use 'folke/tokyonight.nvim'
use 'brooth/far.vim'
use 'kyazdani42/nvim-web-devicons'
use 'onsails/lspkind-nvim'
use 'akinsho/nvim-bufferline.lua'
use 'folke/trouble.nvim'
use 'nvim-lua/popup.nvim'
use 'nvim-lua/plenary.nvim'
use 'nvim-telescope/telescope.nvim'
use 'neovim/nvim-lspconfig'
use 'hrsh7th/nvim-compe'
use 'BurntSushi/ripgrep'
use 'simeji/winresizer'
use 'tpope/vim-fugitive'
use 'liuchengxu/vista.vim'
use 'rhysd/reply.vim'
use 'hoob3rt/lualine.nvim'
use 'mbbill/undotree'
-- use 'ludovicchabant/vim-gutentags'
use "steelsojka/pears.nvim"
use 'tweekmonster/startuptime.vim'
use 'thinca/vim-quickrun'
use 'ntpeters/vim-better-whitespace'
use 'tpope/vim-surround'
use 'phaazon/hop.nvim'
use 'folke/which-key.nvim'
use 'Vimjas/vim-python-pep8-indent'
use 'tpope/vim-commentary'
use 'szw/vim-maximizer'
use 'chaoren/vim-wordmotion'
use 'tpope/vim-sensible'
use 'mhartington/formatter.nvim'
use { 'kassio/neoterm'}
use { "ray-x/lsp_signature.nvim"}
use {"lambdalisue/fern.vim"}

use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
use { 'michaelb/sniprun', run = 'bash install.sh'}
use {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'}
use {'sakhnik/nvim-gdb', run=':!./install.sh'}
use {'kkoomen/vim-doge', run=function() vim.fn['doge#install()'](0) end}
use {'lukas-reineke/indent-blankline.nvim'}
end)
