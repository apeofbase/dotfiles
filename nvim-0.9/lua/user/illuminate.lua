local status_ok, illuminate = pcall(require, "illuminate")
if not status_ok then
  return
end

-- change the highlight style
vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#191A21"})
vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#191A21"})
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#191A21"})

--- auto update the highlight style on colorscheme change
vim.api.nvim_create_autocmd({ "ColorScheme" }, {
  pattern = { "*" },
  callback = function(ev)
    vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#191A21"})
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#191A21"})
    vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#191A21"})
  end
})

illuminate.configure({
  providers = {
    --'lsp',
    -- 'treesitter',
    'regex',
  },
  delay = 100,
  filetypes_denylist = {
    'alpha',
    'fugitive',
    'NvimTree',
  },
})
