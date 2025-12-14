require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls", "clangd", "bashls" }
}

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    client.server_capabilities.semanticTokensProvider = nil
  end,
})

vim.lsp.enable('bashls')
vim.lsp.enable('lua_ls')
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
})
