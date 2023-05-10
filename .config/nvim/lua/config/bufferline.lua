local bufferline = require('bufferline')

bufferline.setup({
    options = {
        style_preset = bufferline.style_preset.no_italic,
        separator_style = 'slant',
        hover = {
            enabled = true,
            reveal = {'close'}
        }
    }
})
