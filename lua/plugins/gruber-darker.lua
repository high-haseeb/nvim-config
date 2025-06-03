return {
    "blazkowolf/gruber-darker.nvim",
    opts = {
        bold = true,
        invert = {
            signs = true,
            visual = true,
            selection = true,
        },
        italic = {
            strings = false,
            comments = false,
            operators = false,
            fold = false,
        },
        undercurl = false,
        underline = true,
    },
    config = function()
        vim.cmd([[colorscheme gruber-darker]])
    end
}
