-- Automatically install Lazy
local fn = vim.fn
local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Install all plugins
require("lazy").setup({

  -- Colorschemes
  { "mhartington/oceanic-next", priority = 1000 },
  { "Mofiqul/dracula.nvim", priority = 999 },
  { "folke/tokyonight.nvim", commit = "e330187" },
  { "lunarvim/darkplus.nvim", commit = "2584cdeefc078351a79073322eb7f14d7fbb1835" },

  -- UI
  { 'nvim-tree/nvim-web-devicons', commit = '794bba734ec95eaff9bb82fbd112473be2087283' },
  { 'nvim-telescope/telescope.nvim', tag = '0.1.6', dependencies = { 
      'nvim-telescope/telescope-live-grep-args.nvim', version = '^1.0.0',  -- grep with arguments
      'nvim-lua/plenary.nvim', tag = "v0.1.4", -- Useful lua functions used by lots of plugins
    },
  },
  { "kyazdani42/nvim-tree.lua", commit = "bdb6d4a25410da35bbf7ce0dbdaa8d60432bc243" }, -- File browser
  { "akinsho/bufferline.nvim", commit = "9e8d2f695dd50ab6821a6a53a840c32d2067a78a" }, -- Top tabs
  { "goolord/alpha-nvim", commit = "29074eeb869a6cbac9ce1fbbd04f5f5940311b32" }, -- Custom start pages
  { "nvim-lualine/lualine.nvim", commit = "3362b28f917acc37538b1047f187ff1b5645ecdd" }, -- Custom status line at bottom
  { "akinsho/toggleterm.nvim", commit = "6b334b9d1266b0f58ab1b6965c1e5b7eb5c34523" }, -- Built-in terminal access
  { "xiyaowong/transparent.nvim", commit = "fd35a46f4b7c1b244249266bdcb2da3814f01724" }, -- Transparent background

  -- Utilities & Text
  { "tpope/vim-surround", commit = "bf3480dc9ae7bea34c78fbba4c65b4548b5b1fea" },
  { 'windwp/nvim-autopairs', event = "InsertEnter", commit = "0f04d78619cce9a5af4f355968040f7d675854a1"}, -- Autopairs {[]}, integrated w/ cmp and treesitter
  { "lukas-reineke/indent-blankline.nvim", commit = "6177a59552e35dfb69e1493fd68194e673dc3ee2" }, -- Line indention guides
  { "numToStr/Comment.nvim", lazy = false, commit = "176e85eeb63f1a5970d6b88f1725039d85ca0055" },
  { "JoosepAlviste/nvim-ts-context-commentstring", commit = "b8ff464f2afc2000f6c72fa331a8fc090cb46b39" },
  { "RRethy/vim-illuminate", commit = "3bd2ab64b5d63b29e05691e624927e5ebbf0fb86" }, -- Highlight other uses of words under cursor
  { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }, -- Buffer management

  -- Git
  { "lewis6991/gitsigns.nvim", commit = "6ef8c54fb526bf3a0bc4efb0b2fe8e6d9a7daed2" },
  { "tpope/vim-fugitive" },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", version = "v0.9.*" },
  { "kaermorchen/tree-sitter-twig", version = "v0.4.*" },
  
  -- Snippets NOTE: On the chopping block
  { "L3MON4D3/LuaSnip", version = "v2.0", dependencies = 
    { "rafamadriz/friendly-snippets", commit = "53d3df271d031c405255e99410628c26a8f0d2b0" },
  }, -- Snippet engine

  -- Completion
  { "hrsh7th/nvim-cmp", commit = "0b751f6beef40fd47375eaf53d3057e0bfa317e4" }, -- The completion plugin
  { "hrsh7th/cmp-buffer", commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323" }, -- buffer completions
  { "hrsh7th/cmp-path", commit = "466b6b8270f7ba89abd59f402c73f63c7331ff6e" }, -- path completions
  { "saadparwaiz1/cmp_luasnip", commit = "05a9ab28b53f71d1aece421ef32fee2cb857a843" }, -- snippet completions
  { "hrsh7th/cmp-nvim-lua", commit = "f12408bdb54c39c23e67cab726264c10db33ada8" }, -- Source for neovim Lua API
  { "hrsh7th/cmp-calc", commit = "ce91d14d2e7a8b3f6ad86d85e34d41c1ae6268d9" },

  -- LSP
  -- { "williamboman/mason.nvim", version = "v1.10.*" }, -- LSP & DAP manager
  -- { "yaegassy/coc-intelephense", version = "v0.28.*" }, -- PHP LSP
  -- { "hashicorp/terraform-ls", version = "v0.32.*" }, -- Terraform LSP
  -- { "neovim/nvim-lspconfig", version = "v0.1.7" }, -- enable LSP

  -- TODO: Switch to https://github.com/williamboman/mason.nvim
--  -- DAP
--  use { "mfussenegger/nvim-dap", commit = "014ebd53612cfd42ac8c131e6cec7c194572f21d" }
--  use { "rcarriga/nvim-dap-ui", commit = "d76d6594374fb54abf2d94d6a320f3fd6e9bb2f7" }
--  use { "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" }

})
