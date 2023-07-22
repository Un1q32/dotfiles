vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', { silent = true })

vim.opt.number = true
vim.opt.showmode = false
vim.opt.showcmd = false
vim.opt.laststatus = 0
vim.opt.cmdheight = 0
vim.opt.autoread = true

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.opt.clipboard = 'unnamedplus'
vim.opt.backspace = '2'

vim.opt.termguicolors = false

vim.cmd.colorscheme('noctu')
