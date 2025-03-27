local modules = {
	pioneer = "pioneer",
--	fillika = "fillika", note: maybe in the future next module
}

local module_name = modules["pioneer"]

require(module_name .. "." .. "options")
require(module_name .. "." .. "config.config")

-- vim.cmd "colorscheme kanagawa"
vim.cmd("colorscheme onedark")

-- Custom macroses
local esc = vim.api.nvim_replace_termcodes("<Esc>", true, true, true)

vim.fn.setreg("l", 'iconsole.debug("' .. esc .. 'pa:", ' .. esc .. 'pa);')
