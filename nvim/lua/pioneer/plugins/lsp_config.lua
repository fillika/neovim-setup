return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local lspconfig = require('lspconfig')
      	local mason_lspconfig = require('mason-lspconfig')

		local servers = {
			"ts_ls",
			"lua_ls",
			"clangd",
			"gopls",
		}

		-- Установка серверов через mason
		mason_lspconfig.setup({
			ensure_installed = servers,
		})

		-- Настройка каждого сервера
		mason_lspconfig.setup_handlers({
			function(server_name)
				lspconfig[server_name].setup {}
			end,
			-- Доп настройки для каждого сервера.
			["lua_ls"] = function()
				lspconfig.lua_ls.setup {
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
						},
					},
				}
			end,
		})

		-- keymaps
		local keymap = vim.keymap

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
        		-- See `:help vim.lsp.*` for documentation on any of the below functions
        		local opts = { buffer = ev.buf, silent = true }

				-- Set keybind
				opts.desc = "Show LSP references"
				keymap.set("n", "<leader>rf", ":Telescope lsp_references<CR>", opts)

				opts.desc = "Smart rename"
        		keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

				-- Get the LSP client
				local client = vim.lsp.get_client_by_id(ev.data.client_id)

				-- Check if the server supports the declaration method
				if client.server_capabilities.declarationProvider then
					opts.desc = "Show declaration"
					keymap.set("n", "<leader>dc", vim.lsp.buf.declaration, opts)
				end
			end
		})
	end
}
