local colorscheme = "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

-- Make background transparent
vim.cmd 'TransparentEnable'

-- Need to double set colorscheme due to bug
vim.cmd 'colorscheme tokyonight'
