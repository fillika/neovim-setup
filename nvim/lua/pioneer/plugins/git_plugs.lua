return {
    {
        "lewis6991/gitsigns.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            -- Установка подсветки для значков
            vim.api.nvim_set_hl(0, "GitSignsAdd", { link = "GitGutterAdd" })
            vim.api.nvim_set_hl(0, "GitSignsAddLn", { link = "GitSignsAddLn" })
            vim.api.nvim_set_hl(0, "GitSignsAddNr", { link = "GitSignsAddNr" })
            vim.api.nvim_set_hl(0, "GitSignsChange", { link = "GitGutterChange" })
            vim.api.nvim_set_hl(0, "GitSignsChangeLn", { link = "GitSignsChangeLn" })
            vim.api.nvim_set_hl(0, "GitSignsChangeNr", { link = "GitSignsChangeNr" })
            vim.api.nvim_set_hl(0, "GitSignsChangedelete", { link = "GitGutterChangeDelete" })
            vim.api.nvim_set_hl(0, "GitSignsChangedeleteLn", { link = "GitSignsChangeDeleteLn" })
            vim.api.nvim_set_hl(0, "GitSignsChangedeleteNr", { link = "GitSignsChangeDeleteNr" })
            vim.api.nvim_set_hl(0, "GitSignsDelete", { link = "GitGutterDelete" })
            vim.api.nvim_set_hl(0, "GitSignsDeleteLn", { link = "GitSignsDeleteLn" })
            vim.api.nvim_set_hl(0, "GitSignsDeleteNr", { link = "GitSignsDeleteNr" })
            vim.api.nvim_set_hl(0, "GitSignsTopdelete", { link = "GitGutterDeleteChange" })
            vim.api.nvim_set_hl(0, "GitSignsTopdeleteLn", { link = "GitSignsDeleteChangeLn" })
            vim.api.nvim_set_hl(0, "GitSignsTopdeleteNr", { link = "GitSignsDeleteChangeNr" })

            require("gitsigns").setup({
                signs = {
                    add = { text = "+" },
                    change = { text = "~" },
                    delete = { text = "_" },
                    topdelete = { text = "‾" },
                    changedelete = { text = "~" },
                },
                numhl = false,
                linehl = false,
                watch_gitdir = {
                    interval = 1000,
                    follow_files = true,
                },
                attach_to_untracked = true,
                current_line_blame = false,
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
                    delay = 500,
                    ignore_whitespace = false,
                },
                sign_priority = 6,
                update_debounce = 100,
                status_formatter = nil,  -- Use default
                max_file_length = 40000, -- Disable if file is longer than this (in lines)
                preview_config = {
                    -- Options passed to nvim_open_win
                    border = "single",
                    style = "minimal",
                    relative = "cursor",
                    row = 0,
                    col = 1,
                },
                on_attach = function(bufnr)
                    local gitsigns = require('gitsigns')

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map('n', '<A-]>', function()
                        gitsigns.nav_hunk('next')
                    end)

                    map('n', '<A-[>', function()
                        gitsigns.nav_hunk('prev')
                    end)

                    -- Actions

                    map('n', '<leader>hs', gitsigns.stage_hunk)
                    map('v', '<leader>hs', function()
                        gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                    end)

                    map('n', '<leader>hu', gitsigns.undo_stage_hunk)

                    map('n', '<leader>hr', gitsigns.reset_hunk)
                    map('v', '<leader>hr', function()
                        gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                    end)

                    map('n', '<leader>hd', gitsigns.diffthis)

                    map('n', '<leader>hS', gitsigns.stage_buffer)
                    map('n', '<leader>hR', gitsigns.reset_buffer)
                    map('n', '<leader>hp', gitsigns.preview_hunk)
                    map('n', '<leader>hi', gitsigns.preview_hunk_inline)
                    map('n', '<leader>hb', function()
                      gitsigns.blame_line({ full = true })
                    end)

                    -- Toggles
                    map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
                    map('n', '<leader>td', gitsigns.toggle_deleted)

                    -- Text object
                    map({'o', 'x'}, 'ih', gitsigns.select_hunk)
                end
            })
        end,
    }
}
