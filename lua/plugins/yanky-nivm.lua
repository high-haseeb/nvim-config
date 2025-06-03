return {
    "gbprod/yanky.nvim",
    dependencies = {
        { "kkharji/sqlite.lua", enabled = not jit.os:find "Windows" },
    },
    config = function()
        local yanky = require("yanky")
        yanky.setup({
            highlight = { timer = 200 },
            ring = { storage = jit.os:find "Windows" and "shada" or "sqlite" },
            picker = {
                telescope = {
                    use_default_mappings = false,
                    mappings = (function()
                        local mapping = require("yanky.telescope.mapping")
                        local mappings = mapping.get_defaults()
                        mappings.i["<c-p>"] = nil
                        return mappings
                    end)(),
                },
            },
        })

        local map = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }
        local plug_opts = { noremap = false, silent = true }

        -- Normal mode mappings
        map("n", "<Leader>fy", "<Cmd>Telescope yank_history<CR>", opts)
        map("n", "y", "<Plug>(YankyYank)", plug_opts)
        map("n", "p", "<Plug>(YankyPutAfter)", plug_opts)
        map("n", "P", "<Plug>(YankyPutBefore)", plug_opts)
        map("n", "gp", "<Plug>(YankyGPutAfter)", plug_opts)
        map("n", "gP", "<Plug>(YankyGPutBefore)", plug_opts)
        map("n", "[y", "<Plug>(YankyCycleForward)", plug_opts)
        map("n", "]y", "<Plug>(YankyCycleBackward)", plug_opts)
        map("n", "]p", "<Plug>(YankyPutIndentAfterLinewise)", plug_opts)
        map("n", "[p", "<Plug>(YankyPutIndentBeforeLinewise)", plug_opts)
        map("n", "]P", "<Plug>(YankyPutIndentAfterLinewise)", plug_opts)
        map("n", "[P", "<Plug>(YankyPutIndentBeforeLinewise)", plug_opts)
        map("n", ">p", "<Plug>(YankyPutIndentAfterShiftRight)", plug_opts)
        map("n", "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", plug_opts)
        map("n", ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", plug_opts)
        map("n", "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", plug_opts)
        map("n", "=p", "<Plug>(YankyPutAfterFilter)", plug_opts)
        map("n", "=P", "<Plug>(YankyPutBeforeFilter)", plug_opts)

        -- Visual mode mappings
        map("x", "y", "<Plug>(YankyYank)", plug_opts)
        map("x", "p", "<Plug>(YankyPutAfter)", plug_opts)
        map("x", "P", "<Plug>(YankyPutBefore)", plug_opts)
        map("x", "gp", "<Plug>(YankyGPutAfter)", plug_opts)
        map("x", "gP", "<Plug>(YankyGPutBefore)", plug_opts)
    end,
}

