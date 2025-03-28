local options = {
	number = true,
	relativenumber = true,
	smartcase = true,
	ignorecase = true,
	shiftwidth = 4,
	tabstop = 4,
	softtabstop = 4,
	expandtab = true,
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
	guifont = "ubuntu:h20",
	guicursor = "n:block,v:ver35,i:ver35",
	langmap =
	"йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ]," ..
	"фa,ыs,вd,аf,пg,рh,оj,лk,дl,ж',э\\," ..
	"яz,чx,сc,мv,иb,тn,ьm,б.,ю/," ..
	"ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ}," ..
	"ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж\",Э|," ..
	"ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б<,Ю>",
    clipboard = "unnamedplus",
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- Установите параметры отступов для JavaScript файлов
vim.api.nvim_create_autocmd("FileType", {
    pattern = "javascript",
    callback = function()
        vim.opt_local.expandtab = true
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
        vim.opt_local.softtabstop = 4
    end,
})
