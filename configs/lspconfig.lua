local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

-- if you just want default config for the servers then put them in a table
local servers = {
  clangd = {
    filetype = { "c", "cpp" },
    capabilities = {
      offsetEncoding = { "utf-16" },
    },
  },
  bufls = {
    cmd = { "bufls", "serve" },
    filetype = { "proto" },
    root_dir = util.root_pattern("buf.work.yaml", ".git"),
  },
  gopls = {
    cmd = { "gopls" },
    filetype = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
      gopls = {
        completeUnimported = true,
        usePlaceholders = true,
        analyses = {
          unusedparams = true,
          fieldalignment = true,
          nilness = true,
          -- shadow = true,
          unusedwrite = true,
          useany = true,
        },
      },
    },
  },
  dockerls = {},
  docker_compose_language_service = {
    cmd = { "docker-compose-langserver", "--stdio" },
    filetypes = { "yaml" },
    root_dir = util.root_pattern("docker-compose.yml", "docker-compose.yaml"),
    single_file_support = true,
  },
}

local base_opt = {
  on_attach = on_attach,
  capabilities = capabilities,
}

for lsp, opt in pairs(servers) do
  lspconfig[lsp].setup(vim.tbl_deep_extend("force", base_opt, opt))
end
