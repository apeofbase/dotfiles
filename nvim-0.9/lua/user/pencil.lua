-- vim.cmd [[
--   autocmd!
--   autocmd FileType markdown,mkd call pencil#init()
--   autocmd FileType text call pencil#init()
-- ]]

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "markdown", "md", "mkd", "txt", "text" },
  callback = function()
    vim.cmd "Pencil" -- initialize
    vim.opt_local.wrap = true
    vim.g["pencil#wrapModeDefault"] = "soft"
    vim.g["pencil#autoformat"] = 1
    vim.opt.conceallevel = 2
  end,
})

-- The above code only partially applies.
-- the `vim.g` options do not seem to set
-- @TODO add auto-save.nvim
