local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = require "custom.lspconfig.config"

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
