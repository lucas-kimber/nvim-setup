local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
    require("plugins.colorscheme"),
    require("plugins.telescope"),
    require("plugins.treesitter"),
    require("plugins.neo-tree"),
})

