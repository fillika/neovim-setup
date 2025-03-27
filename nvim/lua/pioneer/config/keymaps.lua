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

-- NeoVim
vim.keymap.set("n", "<A-,>", ":vertical resize -10<CR>", opts)
vim.keymap.set("n", "<A-.>", ":vertical resize +10<CR>", opts)

-- NeoTree
keymap("n", "<leader><Tab>", ":Neotree toggle focus reveal<CR>", opts)
keymap("n", "<leader>e", ":Neotree float focus reveal<CR>", opts)

-- Telescope
keymap('n', '<leader>ff', ":Telescope find_files<CR>", { desc = 'Telescope find files' })
keymap('n', '<leader>fb', ":Telescope buffers<CR>" , { desc = 'Telescope buffers' })
keymap('n', '<leader>lg', ":Telescope live_grep<CR>" , { desc = 'Telescope live grep' })
keymap('n', '<leader>ht', ":Telescope help_tags<CR>" , { desc = 'Telescope help tags' })
keymap('n', '<leader>fd', ":Telescope lsp_definitions<CR>" , { desc = 'Telescope find definitions' })
keymap('n', '<leader>fr', ":Telescope lsp_references<CR>" , { desc = 'Telescope find references' })
