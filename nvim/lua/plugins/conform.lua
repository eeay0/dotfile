return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>f",
            function() require("conform").format({ async = true }) end,
            mode = "",
            desc = "Format buffer",
        },
    },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            markdown = { "prettier" },
            zsh = { "beautysh" },
            sh = { "shfmt" },
            jsonc = { "prettier" },
        },
        default_format_opts = {
            lsp_format = "fallback",
        },
        -- format_on_save = { timeout_ms = 500 },
    },
    init = function() vim.o.formatexpr = "v:lua.require'conform'.formatexpr()" end,
}
