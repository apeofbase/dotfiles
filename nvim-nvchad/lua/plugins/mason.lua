return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "css-lsp",
        "eslint-lsp",
        "html-lsp",
        "lua-language-server",
        "phpactor",
        "prettier",
        "stylua",
        "twiggy-language-server",
        "yaml-language-server",
      },
      on_attach = function(bufnr)
        vim.keymap.set("n", ":MasonInstallAll", require('nvchad.mason').install_all(), opts("Mason Install All"))
      end
    },
  },
}
