local modules = {
	pioneer = "pioneer",
--	fillika = "fillika",
}

local module_name = modules["pioneer"]

require(module_name .. "." .. "options")
require(module_name .. "." .. "config.config")

vim.cmd "colorscheme kanagawa"
-- vim.cmd("colorscheme onedark")
