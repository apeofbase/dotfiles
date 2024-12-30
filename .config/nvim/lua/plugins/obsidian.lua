return {
  {
    "epwalsh/obsidian.nvim",
    version = "v3.7.*",
    ft = "markdown",
    lazy = false,
    opts = {
      event = {
        "BufReadPre " .. vim.fn.expand "~" .. "/Vaults/**.md",
        "BufNewFile " .. vim.fn.expand "~" .. "/Vaults/**.md",
      },
      workspaces = {
        {
          name = "personal",
          path = "~/Vaults/personal"
        },
        -- {
        --   name = "work",
        --   path = "~/Vaults/work"
        -- },
      },

      new_notes_location = "current_dir",

      note_id_func = function(title)
        local prefix = ""
        local suffix = ""
        if string.find(title, 'worklog') then
          -- If title starts with "worklog" include week number
          prefix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower() .. "--" .. tostring(os.date('%V--'))
        elseif title ~= nil then
          -- If title is given, transform it into valid file name.
          prefix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower() .. "-"
        else
          -- If title is nil, just add time to end
          suffix = tostring(os.date('--%H:%M:%S'))
        end
        return prefix .. tostring(os.date('%Y-%m-%d')) .. suffix
      end,

      picker = {
        name = "telescope.nvim",
        mappings = {
          new = "<C-x>",
          insert_link = "<C-l>",
        },
      },

      -- Keymaps
      mappings = {
        ["<leader>on"] = {
          action = ":ObsidianNew<CR>",
          opts = { buffer = true, noremap = true, silent = false, desc = "Obsidian New" }
        },
        ["<leader>ot"] = {
          action = function()
            return require("obsidian").util.toggle_checkbox()
          end,
          opts = { buffer = true, noremap = true, silent = false, desc = "Obsidian Toggle Checkbox" }
        },
      }

    }
  },
}
