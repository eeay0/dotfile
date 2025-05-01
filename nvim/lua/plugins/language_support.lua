return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "saghen/blink.cmp",
        "smjonas/inc-rename.nvim",
        "folke/neodev.nvim",
        "mfussenegger/nvim-lint",
        "stevearc/conform.nvim",
    },
    init = function() end,
    event = { "BufRead", "BufNewFile" },
    config = function()
        local opts = { buffer = bufnr, noremap = true, silent = true }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        -- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set(
            "n",
            "<space>wr",
            vim.lsp.buf.remove_workspace_folder,
            opts
        )
        vim.keymap.set(
            "n",
            "<space>wl",
            function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
            opts
        )
        vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
        -- vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.get_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.get_next, opts)
        vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)
        -- vim.keymap.set('n', '<space>f', vim.lsp.buf.format, opts)
        vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action)

        local lsp = require("lspconfig")
        local capabilities = require("blink.cmp").get_lsp_capabilities()
        capabilities.offsetEncoding = "utf-8"

        require("neodev").setup({
            library = { plugins = { "nvim-dap-ui" }, types = true },
        })
        require("inc_rename").setup({})
        vim.keymap.set("n", "<space>rn", ": IncRename ", opts)

        --- SERVERS
        lsp.lua_ls.setup({ capabilities = capabilities })
        lsp.html.setup({ capabilities = capabilities })
        lsp.cssls.setup({ capabilities = capabilities })
        lsp.ts_ls.setup({ capabilities = capabilities })
        lsp.bashls.setup({ capabilities = capabilities })
        lsp.pyright.setup({ capabilities = capabilities })
        lsp.marksman.setup({ capabilities = capabilities })
        -- formatter
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                javascript = {
                    "prettier",
                },
                html = { "prettier" },
                css = { "prettier" },
                bash = { "shfmt" },
                python = { "black" },
                markdown = { "prettier" },
            },

            formatters = {
                shfmt = {
                    prepend_args = { "-i", "2" },
                },
            },
        })

        vim.keymap.set(
            "n",
            "<leader>f",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end
        )
        -- linter
        require("lint").linters_by_ft = {
            lua = { "luacheck" },
        }

        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()
                require("lint").try_lint()
                -- require("lint").try_lint("cspell")
            end,
        })
    end,
}
