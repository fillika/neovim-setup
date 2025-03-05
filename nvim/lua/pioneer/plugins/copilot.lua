return {
	-- Установка copilot.vim
	{
		"github/copilot.vim",
		config = function()
			-- Настройка copilot.vim
		end,
	},
	-- Установка copilot.lua
	{
		"zbirenbaum/copilot.lua",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = true,
					auto_trigger = false,
					debounce = 75,
					keymap = {
						accept = "<M-CR>", -- Принять текущее предложение Copilot (Alt + Enter)
						next = "<M-]>",    -- Перейти к следующему предложению Copilot (Alt + ])
						prev = "<M-[>",    -- Перейти к предыдущему предложению Copilot (Alt + [)
					},
				},
				filetypes = {
					yaml = false,
					markdown = false,
					help = false,
					gitcommit = false,
					gitrebase = false,
					hgcommit = false,
					svn = false,
					cvs = false,
					["."] = false,
				},
				copilot_node_command = "node", -- Node.js version must be > 16.x
				server_opts_overrides = {},
			})
		end,
	},
}
