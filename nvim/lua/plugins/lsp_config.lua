return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "smjonas/inc-rename.nvim",
    },
    event = { "BufRead", "BufNewFile" },
    config = function()
        local opts = { buffer = bufnr, noremap = true, silent = true }
        local map = vim.keymap.set
        map("n", "gD", vim.lsp.buf.declaration, opts)
        map("n", "gd", vim.lsp.buf.definition, opts)
        map("n", "K", vim.lsp.buf.hover, opts)
        map("n", "gi", vim.lsp.buf.implementation, opts)
        -- map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
        -- map(
        --     "n",
        --     "<space>wr",
        --     vim.lsp.buf.remove_workspace_folder,
        --     opts
        -- )
        -- map(
        --     "n",
        --     "<space>wl",
        --     function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
        --     opts
        -- )
        map("n", "<space>D", vim.lsp.buf.type_definition, opts)
        map("n", "gr", vim.lsp.buf.references, opts)
        map("n", "<space>e", vim.diagnostic.open_float, opts)
        map("n", "[d", vim.diagnostic.get_prev, opts)
        map("n", "]d", vim.diagnostic.get_next, opts)
        map("n", "<space>q", vim.diagnostic.setloclist, opts)
        map("n", "<space>ca", vim.lsp.buf.code_action)

        require("inc_rename").setup({})
        map("n", "<space>rn", ": IncRename ", opts)

        -- local capabilities = require("blink.cmp").get_lsp_capabilities()
        -- capabilities.offsetEncoding = "utf-8"

        vim.lsp.enable("lua_ls")
    end,
}
