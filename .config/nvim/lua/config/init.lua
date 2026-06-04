require('config.treesitter')
if vim.fn.system('uname -o') ~= 'Android\n' then
  require('config.lsp')
end

require('Comment').setup()
require('guess-indent').setup()
