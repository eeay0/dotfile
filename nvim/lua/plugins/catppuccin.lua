return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
        require("catppuccin").setup({
            flavour = "mocha",
            background = { -- :h background
                light = "latte",
                dark = "mocha",
            },
            transparent_background = false, -- disables setting the background color.
            dim_inactive = {
                enabled = true, -- dims the background color of inactive window
                shade = "dark",
                percentage = 0.15, -- percentage of the shade to apply to the inactive window
            },
            styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
                comments = { "italic" }, -- Change the style of comments
                conditionals = { "italic", "bold" },
                loops = { "italic", "bold" },
                functions = { "bold" },
                keywords = { "italic" },
                strings = { "italic" },
                variables = {},
                numbers = {},
                booleans = { "bold" },
                properties = {},
                types = { "bold" },
                operators = {},
            },
            integrations = {
                blink_cmp = true,
                gitsigns = true,
                treesitter = true,
                noice = true,
                notify = true,
                harpoon = true,
                rainbow_delimiters = true,
                flash = true,
                telescope = {
                    enabled = true,
                    style = "nvchad",
                },
                lsp_trouble = true,
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { "italic" },
                        hints = { "italic" },
                        warnings = { "italic" },
                        information = { "italic" },
                    },
                    underlines = {
                        errors = { "underline" },
                        hints = { "underline" },
                        warnings = { "underline" },
                        information = { "underline" },
                    },
                    inlay_hints = {
                        background = true,
                    },
                    treesitter_context = true,
                    markdown = false,
                    render_markdown = true,
                },
            },
        })
        vim.cmd.colorscheme("catppuccin")
    end,
}
