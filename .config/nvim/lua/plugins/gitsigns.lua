return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      auto_attach = true,
      attach_to_untracked = false,
      current_line_blame = false,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 50,
        ignore_whitespace = false,
      },
    }
  }
}
