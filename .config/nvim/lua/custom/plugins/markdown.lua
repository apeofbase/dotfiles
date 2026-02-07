-- Conditionally load the RenderMarkdown plugin
-- If the markdown file is in an Obsidian Vault, do not use
local function should_load_render_markdown()
  local bufname = vim.api.nvim_buf_get_name(0)
  if bufname == '' then
    return true
  end -- allow loading if no buffer yet
  local home = vim.fn.expand '~'
  local vaults_path = home .. '/Vaults'
  if bufname:sub(1, #vaults_path) == vaults_path then
    return false
  end
  return true
end

return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'codecompanion', 'markdown' },
    cond = should_load_render_markdown,
    opts = {
      bullet = {
        -- Good dots: '', '', '', ''
        icons = { '' },
      },
    },
  },
}
