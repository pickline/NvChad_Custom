local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "c",
    "markdown",
    "markdown_inline",
    "go",
    "proto",
    "toml",
    "bash",
    "rust",
    "dockerfile",
    "python",
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

    -- c/cpp stuff
    "clangd",
    "clang-format",

    "gopls",
    "goimports-reviser",
    "golines",
    "buf",
    "buf-language-server",
    "docker-compose-language-service",
    "dockerfile-language-server",
    "protolint",
    "taplo",
    "sqlls",
    "sql-formatter",
    "bash-language-server",
    "python-language-server",
    "black",
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

return M
