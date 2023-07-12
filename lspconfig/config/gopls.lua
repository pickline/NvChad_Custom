local util = require "lspconfig/util"
local M = {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
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
}

if vim.lsp.inlay_hint then
  M.settings.gopls.hints = {
    rangeVariableTypes = true,
    parameterNames = true,
    constantValues = true,
    assignVariableTypes = true,
    compositeLiteralFields = true,
    compositeLiteralTypes = true,
    functionTypeParameters = true,
  }
end

return M
