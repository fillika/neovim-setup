return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("todo-comments").setup({
            -- Настройка ключевых слов и их цветов
            keywords = {
                fix = {
                    icon = " ",
                    color = "#FF0000",
                    alt = { "FIX", "FIXME", "BUG", "bug", "FIXIT", "issue", "ISSUE" }, -- Альтернативные ключевые слова
                },
                todo = { icon = " ", color = "chocolate", alt = { "TODO" } },
                hack = { icon = " ", color = "warning" },
                warn = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
                perf = { icon = " ", color = "hint", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                note = {
                    icon = " ", -- Иконка карандаша в стиле Nerd Fonts
                    color = "greenSea",
                    alt = { "NOTE", "info", "INFO" },
                },
            },
            colors = {
                greenSea = "#2E8B57", -- Зеленое море
                chocolate = "#D2691E",
                error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
                warning = { "DiagnosticWarning", "WarningMsg", "#FBBF24" },
                info = { "DiagnosticInfo", "#2563EB" },
                hint = { "DiagnosticHint", "#10B981" },
                default = { "Identifier", "#7C3AED" },
            },
            highlight = {
                pattern = [[.*(\/\/|#|--|\*)\s*(KEYWORDS)\s*]],
            },
            -- Настройка цветов
            -- todo  Hello without :
            -- todo: Hello
            -- hack: Hello
            -- warn: Hello
            -- perf: Hello
            -- note: Hello
            -- fix: Hello
        })
    end,
}
