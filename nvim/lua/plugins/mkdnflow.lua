return {
    "jakewvincent/mkdnflow.nvim",
    ft = { "markdown" },
    config = function()
        require("mkdnflow").setup({
            perspective = {
                priority = "root",
                fallback = "current",
                root_tell = "main",
                nvim_wd_heel = true,
                update = true,
            },
            wrap = true,
            silent = false,
            links = {
                style = "markdown",
                conceal = true,
                transform_implicit = function(input)
                    if input:match("%d%d%d%d%-%d%d%-%d%d") then
                        return ("journals/" .. input)
                    end
                end,
                transform_explicit = function(text)
                    text = text:gsub(" ", "-")
                    text = text:lower()
                    text = os.date("%Y-%m-%d_") .. text
                    return text
                end,
                create_on_follow_failure = true,
            },
            tables = {
                trim_whitespace = true,
                format_on_move = true,
                auto_extend_rows = true,
                auto_extend_cols = true,
                style = {
                    cell_padding = 1,
                    separator_padding = 1,
                    outer_pipes = true,
                    mimic_alignment = true,
                },
            },
            mappings = {
                MkdnFoldSection = false,
                MkdnUnfoldSection = false,
            },
        })
        vim.api.nvim_create_autocmd(
            "FileType",
            { pattern = "markdown", command = "set awa" }
        )
    end,
}
