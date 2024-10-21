vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', { silent = true })
vim.keymap.set('n', '<leader>f', ':lua vim.lsp.buf.format()<CR>', { silent = true })

vim.opt.number = true
vim.opt.showmode = false
vim.opt.showcmd = false
vim.opt.laststatus = 0
vim.opt.cmdheight = 0
vim.opt.autoread = true

if vim.o.filetype ~= "sh" then
  vim.opt.shiftwidth = 4
  vim.opt.tabstop = 4
  vim.opt.softtabstop = 4
else
  vim.opt.shiftwidth = 2
  vim.opt.tabstop = 2
  vim.opt.softtabstop = 2
end

vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.opt.clipboard = 'unnamedplus'
vim.opt.backspace = '2'

vim.opt.termguicolors = true

vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '󰀪', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '󰌶', texthl = 'DiagnosticSignHint' })

vim.cmd.colorscheme('base16-classic-dark')
