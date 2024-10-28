return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "kaermorchen/tree-sitter-twig", version = "v0.4.*",
    },
    opts = {
      ensure_installed = "all",
      ignore_install = { "phpdoc", "wing" },
      highlight = {
        enable = true,
      },
      autopairs = {
        enable = true,
      },
      indent = {
        enable = true,
      },

    },
  },
}
