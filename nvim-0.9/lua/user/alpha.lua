local alpha = require("alpha")
local dashboard = require "alpha.themes.dashboard"

dashboard.section.header.val = {
  [[  ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓]],
  [[  ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒]],
  [[ ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░]],
  [[ ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ ]],
  [[ ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒]],
  [[ ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░]],
  [[ ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░]],
  [[    ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░   ]],
  [[          ░    ░  ░    ░ ░        ░   ░         ░   ]],
  [[                                 ░                  ]],
  [[                                                    ]],
  -- [[                               __                ]],
  -- [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
  -- [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
  -- [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
  -- [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
  -- [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],

}
dashboard.section.buttons.val = {
  dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
  dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("r", "󰃰  Recent files", ":Telescope oldfiles <CR>"),
  dashboard.button("t", "  Find text", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>"),
  dashboard.button("c", "  Config", ":e ~/.config/nvim/init.lua <CR>"),
  dashboard.button("u", "  Update", ":Lazy<CR>"),
  dashboard.button("q", "  Quit", ":qa<CR>"),
}

local footer = function()
  local info = {}
  local fortune = require("fortune").get_fortune()
  local footer = vim.list_extend(info, fortune)
  return footer
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
