vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

local opts = {}
local plugins = {
    { "rebelot/kanagawa.nvim", name = "kanagawa", priority = 1000 },
    -- init.lua:
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    }
}
require("lazy").setup(plugins, opt)
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
require("kanagawa").setup({
    theme = "wave",
    colors = {
        theme = { all = { ui = { bg_gutter = "none" } } }
    },
    overrides = function(colors)
        local theme = colors.theme
        local makeDiagnosticColor = function(color)
            local c = require("kanagawa.lib.color")
            return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
        end
        return {
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
            PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
            DiagnosticVirtualTextHint  = makeDiagnosticColor(theme.diag.hint),
            DiagnosticVirtualTextInfo  = makeDiagnosticColor(theme.diag.info),
            DiagnosticVirtualTextWarn  = makeDiagnosticColor(theme.diag.warning),
            DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
        }
    end
})
vim.cmd.colorscheme("kanagawa-dragon")
-- Function to cycle between Kanagawa themes
local themes = { "kanagawa-dragon", "kanagawa-wave", "kanagawa-lotus" }
local current_theme = 1

function CycleKanagawaTheme()
    current_theme = current_theme % #themes + 1
    vim.o.background = current_theme == 3 and "light" or "dark" -- Set light mode for Lotus
    vim.cmd.colorscheme(themes[current_theme])
end

vim.api.nvim_set_keymap('n', '<leader>tl', ':lua CycleKanagawaTheme()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})

local config = require("nvim-treesitter.configs")
config.setup = ({
    ensure_installed = {"lua", "javascript", "typescript", "rust", "c", "c++", "go", "python", "java"},
    highlight = { enable = true },
    indent = { enable = true }
})
