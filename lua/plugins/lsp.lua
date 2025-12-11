return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup()

        -- Capabilities for nvim-cmp
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local caps = vim.lsp.protocol.make_client_capabilities()
        caps = cmp_nvim_lsp.default_capabilities(caps)

        -- Auto-format Lua files on save
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.lua|rs",
            callback = function()
                vim.lsp.buf.format({ async = false })
            end,
        })

        local servers = {
            "lua_ls",
            "rust_analyzer",
            "tsserver",
            "dockerls",
            "yamlls",
            "bashls",
            "gopls",
        }

        for _, s in ipairs(servers) do
            vim.lsp.enable(s, { capabilities = caps })
        end

        -- Enable rust_analyzer with extra settings
        vim.lsp.enable("rust_analyzer", {
            capabilities = caps,
            settings = {
                ["rust-analyzer"] = {
                    checkOnSave = { command = "clippy" },
                    rustfmt = { enableRangeFormatting = true },
                },
            },
        })
    end,
}
