local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- NeoTree
keymap("n", "<leader><Tab>", ":Neotree toggle focus reveal<CR>", opts)
keymap("n", "<leader>e", ":Neotree float focus reveal<CR>", opts)

-- Telescope
keymap('n', '<leader>ff', ":Telescope find_files<CR>", { desc = 'Telescope find files' })
keymap('n', '<leader>fg', ":Telescope live_grep<CR>" , { desc = 'Telescope live grep' })
keymap('n', '<leader>fb', ":Telescope buffers<CR>" , { desc = 'Telescope buffers' })
keymap('n', '<leader>fn', ":Telescope help_tags<CR>" , { desc = 'Telescope help tags' })
