local lsp = require("lspconfig")

require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls", "clangd", "bashls" }
}

lsp.clangd.setup({})
lsp.bashls.setup({})
lsp.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
})
require('diagflow').setup()
