local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "go",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    "gopls",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.auto_save = {
  enable = true,
  execution_message = {
    message = function()
      return ("save at " .. vim.fn.strftime "%H:%M:%S")
    end,
    dim = 0.18,
    cleaning_interval = 1250,
  },
  trigger_events = { "InsertLeave", "TextChanged" },
  condition = function(buf)
    local fn = vim.fn
    local utils = require "auto-save.utils.data"

    if fn.getbufvar(buf, "&modifiable" == 1) and utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
      return true
    end
    return false
  end,
  write_all_buffers = true,
  debounce_delay = 135,
}

return M
