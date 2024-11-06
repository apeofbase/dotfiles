-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = {
  "cssls",
  "eslint",
  "html",
  "phpactor",
}

local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- Twiggy
-- npm install -g twiggy-language-server
lspconfig.twiggy_language_server.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    twiggy = {
      framework = "symfony",
      phpExecutable = "/usr/bin/php",
      symfonyConsolePath = "bin/console",
    },
  },
}

lspconfig.yamlls.setup {
  -- other configuration for setup {}
  settings = {
    yaml = {
      -- other settings. note this overrides the lspconfig defaults.
      schemas = {
        -- ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        -- ["../path/relative/to/file.yml"] = "/.github/workflows/*",
        -- ["/path/from/root/of/project"] = "/.github/workflows/*",
      },
    },
  },
}

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
