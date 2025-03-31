return {
    {
        "navarasu/onedark.nvim",
        config = function()
            require("onedark").setup({
                style = "cool",
                transparent = true,
                code_style = {
                    functions = "bold,italic",
                }
            })
        end,
    },
}
