return {
  {
    'obsidian-nvim/obsidian.nvim',
    version = 'v3.11.*',
    ft = 'markdown',
    lazy = false,
    opts = {
      completion = {
        blink = true,
      },
      event = {
        'BufReadPre ' .. vim.fn.expand '~' .. '/Vaults/**.md',
        'BufNewFile ' .. vim.fn.expand '~' .. '/Vaults/**.md',
      },

      workspaces = (function()
        local vaults_path = vim.fn.expand '~/Vaults'
        local directories = {}

        local handle = vim.uv.fs_scandir(vaults_path)
        if handle then
          while true do
            local name, type = vim.uv.fs_scandir_next(handle)
            if not name then
              break
            end

            if type == 'directory' or type == 'link' then
              -- Directly create workspace entries
              table.insert(directories, {
                name = name,
                path = vaults_path .. '/' .. name,
                overrides = { -- Optional workspace-specific settings
                  new_notes_location = 'current_dir',
                },
              })
            end
          end
        end
        return directories -- Return flat array
      end)(),

      new_notes_location = 'current_dir',

      note_id_func = function(title)
        local prefix = ''
        local suffix = ''
        if string.find(title, 'worklog') then
          -- If title starts with "worklog" include week number
          prefix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower() .. '--' .. tostring(os.date '%V--')
        elseif title ~= nil then
          -- If title is given, transform it into valid file name.
          prefix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower() .. '-'
        else
          -- If title is nil, just add time to end
          suffix = tostring(os.date '--%H:%M:%S')
        end
        return prefix .. tostring(os.date '%Y-%m-%d') .. suffix
      end,

      picker = {
        name = 'telescope.nvim',
        mappings = {
          new = '<C-x>',
          insert_link = '<C-l>',
        },
      },

      -- Keymaps
      mappings = {
        ['<leader>on'] = {
          action = ':ObsidianNew<CR>',
          opts = { buffer = true, noremap = true, silent = false, desc = '[O]bsidian [N]ew' },
        },
        ['<leader>ot'] = {
          action = function()
            return require('obsidian').util.toggle_checkbox()
          end,
          opts = { buffer = true, noremap = true, silent = false, desc = '[O]bsidian [T]oggle Checkbox' },
        },
      },
    },
  },
}
