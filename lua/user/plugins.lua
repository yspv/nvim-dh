local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
    use { "wbthomason/packer.nvim", commit = "6afb67460283f0e990d35d229fd38fdc04063e0a" }
    use { "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" }
    use { "kyazdani42/nvim-web-devicons", commit = "563f3635c2d8a7be7933b9e547f7c178ba0d4352" }
    use { "kyazdani42/nvim-tree.lua", commit = "7282f7de8aedf861fe0162a559fc2b214383c51c" }
    use { "windwp/nvim-autopairs" }
    use { "akinsho/bufferline.nvim" }
    use { "nvim-lualine/lualine.nvim" }
    use { "rebelot/heirline.nvim" }
    use { "akinsho/toggleterm.nvim" }
    use { "nvim-treesitter/nvim-treesitter" }
    --use { "lukas-reineke/indent-blankline.nvim"}
    use { "hrsh7th/nvim-cmp", commit = "b0dff0ec4f2748626aae13f011d1a47071fe9abc" } -- The completion plugin
    use { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" } -- buffer completions
    use { "hrsh7th/cmp-path", commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" } -- path completions
    use { "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" } -- snippet completions
    use { "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" }
    use { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }
    use { "L3MON4D3/LuaSnip" }--snippet engine
    use { "rafamadriz/friendly-snippets" }
    -- LSP
    use { "neovim/nvim-lspconfig" }
    use { "williamboman/mason.nvim" } -- simple to use language server installer
    use { "williamboman/mason-lspconfig.nvim" } -- simple to use language server installer
    use { 'jose-elias-alvarez/null-ls.nvim' }
    -- Colorschemes
    use { "folke/tokyonight.nvim", commit = "66bfc2e8f754869c7b651f3f47a2ee56ae557764" }
    use { "ishan9299/nvim-solarized-lua" }
    use { "ajmwagar/vim-deus" }
    use { "jaredgorski/fogbell.vim" }
    use { "sainnhe/everforest" }
    use {'NvChad/nvim-colorizer.lua'}
    use { 'rmehri01/onenord.nvim'}
    use { 'rose-pine/neovim' }
    use { 'harg/iceberg.nvim' }
    use { "ellisonleao/gruvbox.nvim" }
    use { "luisiacc/gruvbox-baby" }
    use { "lalitmee/cobalt2.nvim" }
    use { "tjdevries/colorbuddy.nvim" }
    use { "whatyouhide/vim-gotham" }
    use { "arcticicestudio/nord-vim" }
    use { "rktjmp/lush.nvim" }
    use { "mcchrish/zenbones.nvim" }
    use { 'nyoom-engineering/oxocarbon.nvim' }

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
