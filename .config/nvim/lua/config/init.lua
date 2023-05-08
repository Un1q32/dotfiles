require('config.nvim-tree')
require('config.bufferline')
require('config.lint')
require('config.color')
require('config.noice')
require('config.treesitter')
-- require('config.lspconfig')
-- require('config.completions')

if vim.fn.has('win32') == 0 then
    require('config.debug')
end
