-- Vim level key mappings
vim.g.mapleader = " "
vim.api.nvim_set_keymap('n', '<leader>tl', ':lua CycleKanagawaTheme()<CR>', { noremap = true, silent = true })
