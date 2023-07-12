local M = {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          [vim.fn.stdpath "data" .. "/lazy/extensions/nvchad_types"] = true,
          [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}

if vim.lsp.inlay_hint then
  M.settings.Lua.hint = {
    enable = true,
    arrayIndex = "Auto",
    await = true,
    paramName = "All",
    paramType = true,
    semicolon = "SameLine",
    setType = true,
  }
end

return M
