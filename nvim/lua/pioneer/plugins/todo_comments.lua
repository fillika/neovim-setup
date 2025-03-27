return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("todo-comments").setup({
			-- Настройка ключевых слов и их цветов
			keywords = {
				fix = {
					icon = " ", -- Иконка для FIX
					color = "error", -- Цвет для FIX
					alt = { "FIXME", "BUG", "bug","FIXIT", "ISSUE" }, -- Альтернативные ключевые слова
				},
				todo = { icon = " ", color = "chocolate", alt = { "TODO" } },
				hack = { icon = " ", color = "warning" },
				warn = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
				perf = { icon = " ", color = "hint", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				note = { icon = " ", color = "hint", alt = { "INFO" } },
			},
			-- Настройка цветов
            -- todo: Hello
            -- hack: Hello
            -- warn: Hello
            -- perf: Hello
            -- note: Hello
            -- fix: Hello
			colors = {
                chocolate = { "NiceChocolate", "#D2691E" },
				error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
				warning = { "DiagnosticWarning", "WarningMsg", "#FBBF24" },
				info = { "DiagnosticInfo", "#2563EB" },
				hint = { "DiagnosticHint", "#10B981" },
				default = { "Identifier", "#7C3AED" },
			},
		})
	end,
}
