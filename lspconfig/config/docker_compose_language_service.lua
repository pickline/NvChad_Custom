local util = require "lspconfig.util"
return {
  cmd = { "docker-compose-langserver", "--stdio" },
  filetypes = { "yaml" },
  root_dir = util.root_pattern("docker-compose.yml", "docker-compose.yaml"),
  single_file_support = true,
}
