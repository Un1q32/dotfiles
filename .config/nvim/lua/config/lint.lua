local lint = require('lint')

lint.linters_by_ft = {
    sh = {'shellcheck'},
    c = {'cppcheck'}
}

lint.linters.shellcheck.args = {'--format', 'json', '-', '--exclude=2148,1072'}
lint.linters.cppcheck.args = {
    "--enable=warning,style,performance,information",
    function()
        if vim.bo.filetype == "cpp" then
            return "--language=c++"
        else
            return "--language=c"
        end
    end,
    "--inline-suppr",
    "--quiet",
    "--template={file}:{line}:{column}: [{id}] {severity}: {message}",
    "--suppress=missingIncludeSystem",
}

lint.linters.clangtidy.ignore_exitcode = true
lint.linters.cppcheck.ignore_exitcode = true

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'CursorHold', 'CursorHoldI', 'InsertLeave', 'WinEnter' }, {
    callback = function()
        lint.try_lint()
    end
})
