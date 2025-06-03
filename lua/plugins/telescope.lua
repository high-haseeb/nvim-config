return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function() return vim.fn.executable "make" == 1 end,
        },
    },
    cmd = "Telescope",
    keys = {
        { "<Leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find files" },
        { "<Leader>fg", function() require("telescope.builtin").git_files() end, desc = "Find git files" },
        { "<Leader>fb", function() require("telescope.builtin").buffers() end, desc = "Find buffers" },
        { "<Leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Find help" },
        { "<Leader>fw", function() require("telescope.builtin").live_grep() end, desc = "Find words" },
        { "<Leader>fd", function() require("telescope.builtin").diagnostics() end, desc = "Find Quick-fix list" },
        { "<Leader>fy", function() require("telescope.builtin").registers() end, desc = "Find registers" },
    },
    opts = function()
        local actions = require("telescope.actions")
        return {
            defaults = {
                file_ignore_patterns = { "^%.git/", "node_modules/*" },
                prompt_prefix = "~ ",
                selection_caret = " ",
                sorting_strategy = "ascending",
                layout_config = {
                    horizontal = { prompt_position = "top", preview_width = 0.5 },
                    width = 0.9,
                    height = 0.8,
                },
                mappings = {
                    i = {
                        ["<C-J>"] = actions.move_selection_next,
                        ["<C-K>"] = actions.move_selection_previous,
                        ["<CR>"] = actions.select_default,
                    },
                    n = {
                        q = actions.close,
                    },
                },
            },
        }
    end,
    config = function(_, opts)
        require("telescope").setup(opts)
        require("telescope").load_extension("fzf")
    end,
}
