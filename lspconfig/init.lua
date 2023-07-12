local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = require "custom.lspconfig.config"

-- if you just want default config for the servers then put them in a table
if vim.lsp.inlay_hint then
  servers.gopls.settings.gopls.hints = {
    rangeVariableTypes = true,
    parameterNames = true,
    constantValues = true,
    assignVariableTypes = true,
    compositeLiteralFields = true,
    compositeLiteralTypes = true,
    functionTypeParameters = true,
  }
end

local base_opt = {
  on_attach = on_attach,
  capabilities = capabilities,
}

for lsp, opt in pairs(servers) do
  if type(opt) ~= "table" and opt == true then
    lspconfig[lsp].setup {}
  else
    lspconfig[lsp].setup(vim.tbl_deep_extend("force", base_opt, opt))
  end
end
