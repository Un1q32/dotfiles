require 'nvim-treesitter.configs'.setup({
  ensure_installed = { 'bash', 'lua', 'vim', 'regex', 'markdown', 'markdown_inline', 'vimdoc', 'c', 'diff', 'yaml', 'toml' },
  sync_install = false,
  auto_install = true,
  highlight = { enable = true }
})
