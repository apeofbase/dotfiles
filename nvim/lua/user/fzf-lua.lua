local fzf_lua_status_ok, fzf_lua = pcall(require, "fzf-lua")
if not fzf_lua_status_ok then
  return
end

local actions = require "fzf-lua.actions"

fzf_lua.setup {

  files = {
    previewer         = "bat",          -- set to 'false' to disable
    prompt            = ' ❯ ',
    multiprocess      = true,           -- run command in a separate process
    git_icons         = true,           -- show git icons?
    file_icons        = true,           -- show file icons?
    color_icons       = true,           -- colorize file|git icons
    -- path_shorten   = 1,              -- 'true' or number, shorten path?
    -- executed command priority is 'cmd' (if exists)
    -- otherwise auto-detect prioritizes `fd`:`rg`:`find`
    -- default options are controlled by 'fd|rg|find|_opts'
    -- NOTE: 'find -printf' requires GNU find
    -- cmd            = "find . -type f -printf '%P\n'",
    find_opts         = [[-type f -not -path '*/\.git/*' -printf '%P\n']],
    rg_opts           = "--ignore --no-ignore-vcs --smart-case --color=never --files --hidden --follow -g '!.git'",
    -- rg_opts           = "--ignore --no-ignore-vcs --column --line-number --no-heading --smart-case --color=always --max-columns=512 --hidden -g '!.git'",
    fd_opts           = "--no-ignore --color=never --type f --hidden --follow --exclude .git --exclude vendor",
    actions = {
      -- inherits from 'actions.files', here we can override
      -- or set bind to 'false' to disable a default action
      ["default"]     = actions.file_edit,
      -- custom actions are available too
      ["ctrl-y"]      = function(selected) print(selected[1]) end,
    }
  },

  git = {
    files = {
      prompt = " ❯ "
    },
    status = {
      prompt = " ❯"
    },
    commits = {
      prompt = " ❯"
    },
    branches = {
      prompt = " ❯"
    },
  },

  oldfiles = {
    prompt = " ❯"
  },

  buffers = {
    prompt = " ❯"
  },

  grep = {
    prompt = " ❯",
    rg_opts = "--no-ignore --no-ignore-vcs --hidden --column --line-number --no-heading --color=always --smart-case --max-columns=512 -g '!.git'"
  }
}
