return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    ft = "markdown",
    opts = {},
    config = function()
        require("render-markdown").setup({
            completions = { blink = { enabled = true } },
            checkbox = {
                custom = {
                    todo = {
                        raw = "[-]",
                        rendered = "󰥔",
                        highlight = "RenderMarkdownTodo",
                        scope_highlight = nil,
                    },
                },
            },
            pipe_table = {
                cell = "raw",
            },
        })
    end,
}
