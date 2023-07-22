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
    'tpope/vim-commentary',
    'noahfrederick/vim-noctu',
    'nvim-treesitter/nvim-treesitter',
    'sheerun/vim-polyglot',
    'windwp/nvim-autopairs',
}

local opts = {}

require('lazy').setup(plugins, opts)
