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
    foldmethod = "indent",
    -- foldmethod = "expr",
    -- foldexpr = "v:lua.CustomFold(v:lnum)",
    foldenable = true,
    foldlevel = 5,
    -- foldcolumn = "1",
    colorcolumn = "120",
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- Установка правильных путей для проекта и функций gf/gd
vim.opt.path:append({
    "js/**",
})

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

-- импорт функции foldexpr из Tree-sitter
local ts_foldexpr = function(lnum)
  return vim.treesitter.foldexpr(lnum)
end

function _G.CustomFold(lnum)
  local ts_level = vim.treesitter.foldexpr(lnum)
  if ts_level and tonumber(ts_level) > 0 then
    return ts_level
  end

  local matchers = {
    {
      open = function(line) return line:find("{") end,
      close = function(line) return line:find("}") end,
    },
    {
      open = function(line) return line:find("#region") end,
      close = function(line) return line:find("#endregion") end,
    },
    {
      open = function(line) return line:find("%[") end,
      close = function(line) return line:find("%]") end,
    },
  }

  return _G.SmartBlockFold(lnum, matchers)
end

---@class BlockMatcher
---@field open fun(line: string): boolean
---@field close fun(line: string): boolean

---@param lnum integer
---@param matchers BlockMatcher[]
---@return integer
function _G.SmartBlockFold(lnum, matchers)
  local bufnr = 0
  local total_lines = vim.api.nvim_buf_line_count(bufnr)

  for up = lnum - 1, 0, -1 do
    local line_up = vim.api.nvim_buf_get_lines(bufnr, up, up + 1, false)[1]

    for _, matcher in ipairs(matchers) do
      if matcher.open(line_up) then
        -- нашли открытие, ищем вниз закрытие
        local depth = 1
        for down = up + 1, total_lines - 1 do
          local line_down = vim.api.nvim_buf_get_lines(bufnr, down, down + 1, false)[1]

          if matcher.open(line_down) then
            depth = depth + 1
          elseif matcher.close(line_down) then
            depth = depth - 1
            if depth == 0 then
              -- свернуть строки от up+1 до down-1, оставив открытие/закрытие
              if lnum - 1 == up then
                return 1 -- начало блока
              elseif lnum - 1 > up and lnum - 1 < down then
                return 0 -- внутренняя строка — часть сворачиваемой области
              elseif lnum - 1 == down then
                return -1 -- закрытие блока
              end
              return 0 -- вне блока
            end
          end
        end
      end
    end
  end

  return -1
end
