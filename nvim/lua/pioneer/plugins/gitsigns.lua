return {
	"lewis6991/gitsigns.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		-- Установка подсветки для значков
		vim.api.nvim_set_hl(0, "GitSignsAdd", { link = "GitGutterAdd" })
		vim.api.nvim_set_hl(0, "GitSignsAddLn", { link = "GitSignsAddLn" })
		vim.api.nvim_set_hl(0, "GitSignsAddNr", { link = "GitSignsAddNr" })
		vim.api.nvim_set_hl(0, "GitSignsChange", { link = "GitGutterChange" })
		vim.api.nvim_set_hl(0, "GitSignsChangeLn", { link = "GitSignsChangeLn" })
		vim.api.nvim_set_hl(0, "GitSignsChangeNr", { link = "GitSignsChangeNr" })
		vim.api.nvim_set_hl(0, "GitSignsChangedelete", { link = "GitGutterChangeDelete" })
		vim.api.nvim_set_hl(0, "GitSignsChangedeleteLn", { link = "GitSignsChangeDeleteLn" })
		vim.api.nvim_set_hl(0, "GitSignsChangedeleteNr", { link = "GitSignsChangeDeleteNr" })
		vim.api.nvim_set_hl(0, "GitSignsDelete", { link = "GitGutterDelete" })
		vim.api.nvim_set_hl(0, "GitSignsDeleteLn", { link = "GitSignsDeleteLn" })
		vim.api.nvim_set_hl(0, "GitSignsDeleteNr", { link = "GitSignsDeleteNr" })
		vim.api.nvim_set_hl(0, "GitSignsTopdelete", { link = "GitGutterDeleteChange" })
		vim.api.nvim_set_hl(0, "GitSignsTopdeleteLn", { link = "GitSignsDeleteChangeLn" })
		vim.api.nvim_set_hl(0, "GitSignsTopdeleteNr", { link = "GitSignsDeleteChangeNr" })

		require("gitsigns").setup({
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			numhl = false,
			linehl = false,
			watch_gitdir = {
				interval = 1000,
				follow_files = true,
			},
			attach_to_untracked = true,
			current_line_blame = false,
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 1000,
				ignore_whitespace = false,
			},
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil,  -- Use default
			max_file_length = 40000, -- Disable if file is longer than this (in lines)
			preview_config = {
				-- Options passed to nvim_open_win
				border = "single",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
		})
	end,
}
