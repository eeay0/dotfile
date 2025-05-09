return {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        -- stylua: ignore start
        -- resizing splits with arrow keys + Alt
        vim.keymap.set('n', '<A-Left>', require('smart-splits').resize_left)
        vim.keymap.set('n', '<A-Down>', require('smart-splits').resize_down)
        vim.keymap.set('n', '<A-Up>', require('smart-splits').resize_up)
        vim.keymap.set('n', '<A-Right>', require('smart-splits').resize_right)

        -- moving between splits with arrow keys + Ctrl
        vim.keymap.set('n', '<C-Left>', require('smart-splits').move_cursor_left)
        vim.keymap.set('n', '<C-Down>', require('smart-splits').move_cursor_down)
        vim.keymap.set('n', '<C-Up>', require('smart-splits').move_cursor_up)
        vim.keymap.set('n', '<C-Right>', require('smart-splits').move_cursor_right)
        vim.keymap.set('n', '<C-\\>', require('smart-splits').move_cursor_previous)

        -- swapping buffers with arrow keys + <leader><leader>
        vim.keymap.set('n', '<A-S-Left>', require('smart-splits').swap_buf_left)
    vim.keymap.set('n', '<A-S-Down>', require('smart-splits').swap_buf_down)
        vim.keymap.set('n', '<A-S-Up>', require('smart-splits').swap_buf_up)
        vim.keymap.set('n', '<A-S-Right>', require('smart-splits').swap_buf_right)
        -- stylua: ignore end
    end,
}
