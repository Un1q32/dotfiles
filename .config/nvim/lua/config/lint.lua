require('lint').linters_by_ft = {
    sh = {'shellcheck'},
    c = {'clangtidy'},
}

vim.fn.setenv('SHELLCHECK_OPTS', '--exclude SC2148')

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "CursorHold", "CursorHoldI", "InsertLeave", "WinEnter" }, {
    callback = function()
        require('lint').try_lint()
    end,
})

vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
