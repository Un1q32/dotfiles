require("config.lualine")
require("config.nvim-tree")
require("config.bufferline")
require("config.debug")
require("config.lint")
if vim.fn.has('win32') == 0 then
    require("config.treesitter")
end
-- require("config.lspconfig")
-- require("config.completions")
