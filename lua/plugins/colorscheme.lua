return {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    priority = 1000,
    config = function()
        -- Kanagawa theme setup
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
        vim.cmd.colorscheme("kanagawa-dragon") -- Initial theme

        -- Theme-changing function
        local themes = { "kanagawa-dragon", "kanagawa-wave", "kanagawa-lotus" }
        local current_theme = 1

        function CycleKanagawaTheme()
            current_theme = current_theme % #themes + 1
            vim.o.background = current_theme == 3 and "light" or "dark" -- Set light mode for Lotus
            vim.cmd.colorscheme(themes[current_theme])
        end
        vim.api.nvim_set_keymap('n', '<leader>tl', ':lua CycleKanagawaTheme()<CR>', { noremap = true, silent = true })
    end
}

