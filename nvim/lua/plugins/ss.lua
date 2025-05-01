return {
    "mrjones2014/smart-splits.nvim",
    event = { "BufRead", "BufNewFile" },
    config = function()
        -- recommended mappings
        -- resizing splits
        -- these keymaps will also accept a range,
        -- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
        vim.keymap.set(
            "n",
            "<A-h>",
            function() require("smart-splits").resize_left(5) end
        )
        vim.keymap.set(
            "n",
            "<A-j>",
            function() require("smart-splits").resize_down(5) end
        )
        vim.keymap.set(
            "n",
            "<A-k>",
            function() require("smart-splits").resize_up(5) end
        )
        vim.keymap.set(
            "n",
            "<A-l>",
            function() require("smart-splits").resize_right(5) end
        )
        -- moving between splits
        vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
        vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
        vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
        vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
        vim.keymap.set(
            "n",
            "<C-\\>",
            require("smart-splits").move_cursor_previous
        )
        -- swapping buffers between windows
        vim.keymap.set(
            "n",
            "<leader><leader>h",
            require("smart-splits").swap_buf_left
        )
        vim.keymap.set(
            "n",
            "<leader><leader>j",
            require("smart-splits").swap_buf_down
        )
        vim.keymap.set(
            "n",
            "<leader><leader>k",
            require("smart-splits").swap_buf_up
        )
        vim.keymap.set(
            "n",
            "<leader><leader>l",
            require("smart-splits").swap_buf_right
        )
    end,
}
