local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local M = {}

M.on_attach = function(client, bufnr)
  on_attach(client, bufnr)

  if not vim.lsp.inlay_hint then
    return
  end

  if not client.server_capabilities.inlayHintProvider then
    return
  end

  vim.lsp.inlay_hint(bufnr)
end

M.capabilities = capabilities

return M
