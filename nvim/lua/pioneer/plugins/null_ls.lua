return {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local null_ls = require("null-ls")
        local config_path_prefix = "~/.config/nvim/code_styles/"

        null_ls.setup({
            sources = {
                -- Форматирование с помощью Prettier для JavaScript и TypeScript
                null_ls.builtins.formatting.prettier.with({
                    filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact" },
                    extra_args = { "--config", vim.fn.expand(config_path_prefix .. ".prettierrc") },
                }),
                -- Форматирование для Go
                null_ls.builtins.formatting.gofmt,
                null_ls.builtins.formatting.goimports,
                -- Форматирование для Lua
                null_ls.builtins.formatting.stylua.with({
                    extra_args = { "--config-path", vim.fn.expand(config_path_prefix .. "stylua.toml") },
                }),
                -- Форматирование для C и C++
                null_ls.builtins.formatting.clang_format.with({
                    extra_args = {
                        "--style=file",
                        "--fallback-style=Google",
                        "--assume-filename",
                        vim.fn.expand(config_path_prefix .. ".clang-format"),
                    },
                }),
            },
        })

        -- Keymap для форматирования всего файла
        vim.api.nvim_set_keymap(
            "n",
            "<leader>FM",
            ":lua vim.lsp.buf.format({ async = true })<CR>",
            { noremap = true, silent = true }
        )
    end,
}
