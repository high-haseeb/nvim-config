return {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
        { "<leader>bf", "<Cmd>BufferLinePick<CR>"},
        { "<leader>ba", "<Cmd>BufferLineCloseOthers<CR>"},
        { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
        { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
        { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
        { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
        { "[B", "<cmd>BufferLineMovePrev<cr>",  desc = "Move buffer prev" },
        { "]B", "<cmd>BufferLineMoveNext<cr>",  desc = "Move buffer next" },
    },
    opts = {
        options = {
            --diagnostics = "nvim_lsp",
            always_show_bufferline = false,
            -- diagnostics_indicator = function(_, _, diag)
            --     local icons = LazyVim.config.icons.diagnostics
            --     local ret = (diag.error and icons.Error .. diag.error .. " " or "")
            --     .. (diag.warning and icons.Warn .. diag.warning or "")
            --     return vim.trim(ret)
            -- end,
            offsets = {
                {
                    filetype = "neo-tree",
                    text = "Neo-tree",
                    highlight = "Directory",
                    text_align = "left",
                },
                {
                    filetype = "snacks_layout_box",
                },
            },
        },
    },
    config = function(_, opts)
        require("bufferline").setup(opts)
        vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
            callback = function()
                vim.schedule(function()
                    pcall(nvim_bufferline)
                end)
            end,
        })
    end,
    }
