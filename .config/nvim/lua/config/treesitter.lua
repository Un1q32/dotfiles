require'nvim-treesitter.configs'.setup {
  ensure_installed = { "bash", "lua", "vim", "regex", "markdown", "markdown_inline" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
