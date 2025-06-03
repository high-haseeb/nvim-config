return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    keys = {
        {
            "<leader>o",
            function()
                require("neo-tree.command").execute({
                    toggle = true,
                    reveal = true,
                    position = "current",
                })
            end,
            desc = "Toggle Neo-tree (Highlight Current File)"
        },
    },
}

