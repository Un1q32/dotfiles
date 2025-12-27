local ts = require'nvim-treesitter'
local filetypes = { 'bash', 'sh', 'lua', 'vim', 'regex', 'markdown', 'markdown_inline', 'vimdoc', 'c', 'diff', 'yaml', 'toml', 'make', 'groovy' }

ts.install(filetypes)
vim.api.nvim_create_autocmd('FileType', {
  pattern = filetypes,
  callback = function() vim.treesitter.start() end,
})
