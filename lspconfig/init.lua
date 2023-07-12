local on_attach = require("custom.lspconfig.helper").on_attach
local capabilities = require("custom.lspconfig.helper").capabilities

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
