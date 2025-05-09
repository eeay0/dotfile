return {
    "saghen/blink.cmp",
    event = { "BufRead", "BufNewFile" },
    dependencies = {
        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            build = "make install_jsregexp",
            dependencies = { "rafamadriz/friendly-snippets" },
        },
        "onsails/lspkind.nvim",
        "nvim-tree/nvim-web-devicons",
        {
            "Kaiser-Yang/blink-cmp-dictionary",
            dependencies = { "nvim-lua/plenary.nvim" },
        },
    },
    version = "1.*",
    build = "cargo build --release",
    init = function() require("luasnip.loaders.from_vscode").lazy_load() end,
    opts = {
        keymap = { preset = "enter" },
        signature = {
            enabled = true,
            window = {
                show_documentation = false,
            },
        },
        appearance = {
            nerd_font_variant = "mono",
        },
        completion = {
            documentation = { auto_show = false },
            menu = {
                draw = {
                    components = {
                        kind_icon = {
                            text = function(ctx)
                                local icon = ctx.kind_icon
                                if
                                    vim.tbl_contains(
                                        { "Path" },
                                        ctx.source_name
                                    )
                                then
                                    local dev_icon, _ =
                                        require("nvim-web-devicons").get_icon(
                                            ctx.label
                                        )
                                    if dev_icon then icon = dev_icon end
                                else
                                    icon =
                                        require("lspkind").symbolic(ctx.kind, {
                                            mode = "symbol",
                                        })
                                end

                                return icon .. ctx.icon_gap
                            end,
                            highlight = function(ctx)
                                local hl = ctx.kind_hl
                                if
                                    vim.tbl_contains(
                                        { "Path" },
                                        ctx.source_name
                                    )
                                then
                                    local dev_icon, dev_hl =
                                        require("nvim-web-devicons").get_icon(
                                            ctx.label
                                        )
                                    if dev_icon then hl = dev_hl end
                                end
                                return hl
                            end,
                        },
                    },
                },
            },
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
            per_filetype = { markdown = { "dictionary" } },
            providers = {
                dictionary = {
                    module = "blink-cmp-dictionary",
                    name = "Dict",
                    -- Make sure this is at least 2.
                    -- 3 is recommended
                    min_keyword_length = 2,
                    opts = {
                        dictionary_files = {
                            vim.fn.expand("/usr/share/dict/usa"),
                        },
                        get_command_args = function(prefix, _)
                            return {
                                "--filter=" .. prefix,
                                "--sync",
                                "--no-sort",
                                "-i", -- -i to ignore case, +i to respect case, with no this line is smart case
                            }
                        end,
                    },
                    -- keep case of first char
                    transform_items = function(a, items)
                        local keyword = a.get_keyword()
                        local correct, case
                        if keyword:match("^%l") then
                            correct = "^%u%l+$"
                            case = string.lower
                        elseif keyword:match("^%u") then
                            correct = "^%l+$"
                            case = string.upper
                        else
                            return items
                        end

                        -- avoid duplicates from the corrections
                        local seen = {}
                        local out = {}
                        for _, item in ipairs(items) do
                            local raw = item.insertText
                            if raw:match(correct) then
                                local text = case(raw:sub(1, 1)) .. raw:sub(2)
                                item.insertText = text
                                item.label = text
                            end
                            if not seen[item.insertText] then
                                seen[item.insertText] = true
                                table.insert(out, item)
                            end
                        end
                        return out
                    end,
                },
            },
        },
        fuzzy = { implementation = "rust" },
    },
    opts_extend = { "sources.default" },
}
