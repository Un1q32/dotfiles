require('lint').linters_by_ft = {
    sh = {'shellcheck'},
    bash = {'shellcheck'},
}

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
    callback = function()
        require('lint').try_lint()
    end,
})
