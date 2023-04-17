local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    "github/copilot.vim",
    "norcalli/nvim-colorizer.lua",
    "akinsho/bufferline.nvim",
    "OldWorldOrdr/nvim-base16",
    "nvim-tree/nvim-tree.lua",
    "nvim-tree/nvim-web-devicons",
    "tpope/vim-commentary",
    "mfussenegger/nvim-lint",
    "sheerun/vim-polyglot",
    "folke/noice.nvim",
    "rcarriga/nvim-notify",
    "MunifTanjim/nui.nvim",
    "nvim-treesitter/nvim-treesitter",

    -- "hrsh7th/nvim-cmp",
    -- "hrsh7th/cmp-nvim-lsp",
    -- "L3MON4D3/LuaSnip",
    -- "saadparwaiz1/cmp_luasnip",
    -- "rafamadriz/friendly-snippets",
    -- "williamboman/mason.nvim",
    -- "williamboman/mason-lspconfig.nvim",
    -- "neovim/nvim-lspconfig",
}

local opts = {}

require("lazy").setup(plugins, opts)
