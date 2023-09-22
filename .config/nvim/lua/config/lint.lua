local lint = require('lint')

lint.linters_by_ft = {
    sh = {'shellcheck'},
    c = {'cppcheck'}
}

lint.linters.shellcheck.args = {'--format', 'json', '-', '--exclude=SC2148'}
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
    "--cppcheck-build-dir=" .. vim.env.HOME .. "/.cache/cppcheck",
    "--template={file}:{line}:{column}: [{id}] {severity}: {message}",
    function()
        if vim.fn.has('mac') == 1 then
            return "--suppress=missingIncludeSystem"
        end
    end
}

lint.linters.clangtidy.ignore_exitcode = true
lint.linters.cppcheck.ignore_exitcode = true

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'CursorHold', 'CursorHoldI', 'InsertLeave', 'WinEnter' }, {
    callback = function()
        lint.try_lint()
    end
})
