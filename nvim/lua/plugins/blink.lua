return {
    "saghen/blink.cmp",
    -- optional: provides snippets for the snippet source
    dependencies = {
        "rafamadriz/friendly-snippets",
        {
            "Kaiser-Yang/blink-cmp-dictionary",
            dependencies = { "nvim-lua/plenary.nvim" },
        },
    },

    -- use a release tag to download pre-built binaries
    -- version = "*",
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    build = "cargo build --release",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- 'default' for mappings similar to built-in completion
        -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
        -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
        -- See the full "keymap" documentation for information on defining your own keymap.
        keymap = { preset = "enter" },

        appearance = {
            -- Sets the fallback highlight groups to nvim-cmp's highlight groups
            -- Useful for when your theme doesn't support blink.cmp
            -- Will be removed in a future release
            use_nvim_cmp_as_default = true,
            -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = "mono",
        },

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
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
                buffer = {
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

        completion = {
            menu = {
                draw = {
                    columns = {
                        { "kind_icon" },
                        { "label", "label_description", gap = 1 },
                        { "source_name", "kind", gap = 1 },
                    },
                },
            },
            documentation = { auto_show = true, auto_show_delay_ms = 500 },
        },
        signature = { enabled = true },
    },
    opts_extend = { "sources.default" },
}
