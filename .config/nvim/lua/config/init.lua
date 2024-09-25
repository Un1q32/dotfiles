require('config.treesitter')
if vim.fn.system('uname -o') ~= 'Android\n' then
  require('config.lsp')
end

require("nvim-autopairs").setup()
require('Comment').setup()
require('guess-indent').setup()
