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
    langmap = "фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz,ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ",
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
