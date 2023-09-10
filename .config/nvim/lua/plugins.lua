local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    'numToStr/Comment.nvim',
    'norcalli/nvim-colorizer.lua',
    'OldWorldOrdr/nvim-base16',
    'nvim-treesitter/nvim-treesitter',
    'sheerun/vim-polyglot',
    'windwp/nvim-autopairs',
    'mfussenegger/nvim-lint',
    'github/copilot.vim',
}

local opts = {}

require('lazy').setup(plugins, opts)
