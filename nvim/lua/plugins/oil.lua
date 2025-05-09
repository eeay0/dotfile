return {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    config = function()
        require("oil").setup()
        vim.keymap.set(
            "n",
            "<A-f>",
            "<CMD>Oil<CR>",
            { desc = "Open parent directory" }
        )
    end,
}
