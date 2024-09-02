require("bbangg.set")
require("bbangg.remap")
require("bbangg.lazy_init")

local augroup = vim.api.nvim_create_augroup
local bbanggGroup = augroup('bbangg', {})

local autocmd = vim.api.nvim_create_autocmd

autocmd('LspAttach', {
    group = bbanggGroup,
    callback = function (e)
        local opts = { buffer = e.buf }
        vim.keymap.set('n', 'gd', function () vim.lsp.buf.definition() end, opts)
        vim.keymap.set('n', 'K', function () vim.lsp.buf.hover() end, opts)
        vim.keymap.set('n', '<leader>vca', function () vim.lsp.buf.code_action() end, opts)
        vim.keymap.set('n', '<leader>vrr', function () vim.lsp.buf.references() end, opts)
        vim.keymap.set('n', '<leader>vrn', function () vim.lsp.buf.rename() end, opts)
    end
})

vim.g.netrw_browser_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
