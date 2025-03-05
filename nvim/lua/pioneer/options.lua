local options = {
	number = true,
	relativenumber = true,
	smartcase = true,
	ignorecase = true,
	shiftwidth = 4,
	tabstop = 4,
	showtabline = 2,
	cmdheight = 2,
	fileencoding = "utf-8",
	mouse = "a",
	updatetime = 500,
	splitbelow = true,
	splitright = true,
	wrap = false,
	cursorline = true,
	termguicolors = true,
	-- = ,
	-- = ,
	-- = ,
	-- = ,
	guifont = "ubuntu:h20",
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
