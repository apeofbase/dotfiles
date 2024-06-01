local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

parser_config.twig = {
  install_info = {
    url = "https://github.com/eirabben/tree-sitter-twig",
    files = {"src/parser.c", "src/scanner.cc"},
    branch = "main",
  },
  filetype = "twig",
}
