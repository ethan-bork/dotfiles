return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make"
        },
    },
    config = function()
        require("telescope").setup({
            pickers = {
                find_files = {
                    previewer = false,
                    layout_strategy = "vertical",
                    layout_config = {
                        width = 0.5,   
                        height = 0.4, 
                    },
                },
                live_grep = {
                    layout_strategy = "vertical",
                    layout_config = {
                        width = 0.6,
                        height = 0.8,
                        preview_height = 0.5, 
                    },
                },
            },
        })
        require("telescope").load_extension("fzf")

        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
    end,
}
