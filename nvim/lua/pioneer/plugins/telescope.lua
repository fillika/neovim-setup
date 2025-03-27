return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
        require("telescope").setup({
            defaults = {
                layout_config = {
                    preview_width = 0.65,
                    width = 0.9,
                    height = 0.9,
                },
            },
        })
    end
}
