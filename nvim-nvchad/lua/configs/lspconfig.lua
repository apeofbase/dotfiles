-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = {
  "cssls",
  "eslint",
  "html",
  "jsonls",
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

-- Stylelint
lspconfig.stylelint_lsp.setup {
  filetypes = { "css", "scss" },
  root_dir = lspconfig.util.root_pattern("package.json", ".git"),
  settings = {
    stylelintplus = {
      -- see options in stylelint-lsp documentation
    },
  },
  on_attach = function(client)
    client.server_capabilities.document_formatting = false
  end
}

-- Eslint
-- Install: npm i -g eslint@8
lspconfig.eslint.setup {
  --- ...
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
}

-- Intelephense
-- Install: npm i -g intelephense
-- Add license key to $HOME/intelephense/licence.txt
lspconfig.intelephense.setup {
  capabilities = capabilities,
  settings = {
    intelephense = {
      telemetry = {
        enabled = false,
      },
      completion = {
        fullyQualifyGlobalConstantsAndFunctions = false,
      },
      phpdoc = {
        returnVoid = false,
      },
      files = {
        associations = {
          "*.php",
          "*.phtml",
          "*.module",
          "*.theme",
          "*.inc",
        },
      },
    },
  },
}
-- Twiggy
-- Install: npm install -g twiggy-language-server
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

-- Yaml Language Server
lspconfig.yamlls.setup {
  settings = {
    yaml = {
      schemas = {},
    },
  },
}

-- LSP Mappings
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
