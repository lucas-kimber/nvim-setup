-- Key mappings
vim.g.mapleader = " "
vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>tl', ':lua CycleKanagawaTheme()<CR>', { noremap = true, silent = true })
