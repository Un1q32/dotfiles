local lint = require('lint')

lint.linters_by_ft = {
    sh = {'shellcheck'},
}

lint.linters.shellcheck.args = {'--format', 'json', '-', '--exclude=2148,1072'}

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'CursorHold', 'CursorHoldI', 'InsertLeave', 'WinEnter' }, {
    callback = function()
        lint.try_lint()
    end
})
