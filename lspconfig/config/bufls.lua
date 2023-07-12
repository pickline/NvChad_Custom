local util = require "lspconfig/util"
return {
  cmd = { "bufls", "serve" },
  filetypes = { "proto" },
  root_dir = util.root_pattern("buf.work.yaml", ".git"),
}
