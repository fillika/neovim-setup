return {
    {
        "navarasu/onedark.nvim",
        config = function()
            require("onedark").setup({
                style = "cool",
                transparent = false,
                code_style = {
                    functions = "bold,italic",
                }
            })
        end,
    },
}
