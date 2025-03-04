return {
  "nvimtools/none-ls.nvim",
  config = function()
    -- Load null-ls and extras
    local null_ls = require("null-ls")

    -- Setup null-ls with the required sources
    null_ls.setup({
      sources = {
        -- Python linters and formatters
        null_ls.builtins.diagnostics.pylint,

        -- Kotlin linters and formatters
        null_ls.builtins.formatting.ktlint,
        null_ls.builtins.diagnostics.ktlint,

        -- Java linters and formatters
        null_ls.builtins.formatting.google_java_format,
        null_ls.builtins.diagnostics.checkstyle,

        -- C / C++ linters and formatters
        null_ls.builtins.formatting.clang_format,

        -- Go linters and formatters
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.diagnostics.golangci_lint,

        -- JavaScript / TypeScript linters and formatters
        null_ls.builtins.formatting.prettier,

        -- Lua linters and formatters
        null_ls.builtins.formatting.stylua,
      },
    })

    -- Set up keymap for formatting
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}

