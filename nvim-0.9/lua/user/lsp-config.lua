local mason = require "mason"
local mason_lspconfig = require 'mason-lspconfig'
local lspconfig = require 'lspconfig'

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

mason_lspconfig.setup({
  ensure_installed = {
    "lua_ls",
    "phpactor",
    "tsserver",
    "terraformls",
  }
})

-- Setup language servers
lspconfig.lua_ls.setup {}
lspconfig.phpactor.setup {}
lspconfig.tsserver.setup {}
lspconfig.terraformls.setup {}

-- Keymaps
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
vim.keymap.set("n", "cf", vim.lsp.buf.format, opts)
vim.keymap.set("n", "ca", vim.lsp.buf.code_action, opts)
vim.keymap.set("n", "cr", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "gh", vim.lsp.buf.signature_help, opts)
