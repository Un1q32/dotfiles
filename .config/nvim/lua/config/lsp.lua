local lsp = require("lspconfig")

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
