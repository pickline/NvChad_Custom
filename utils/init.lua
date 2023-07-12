-- vim.loop has been deprecated in nvim:nightly but still available in nvim:0.9.x
local uv = vim.uv or vim.loop
local M = {}

M.walk_path = function(path)
  local init_path = string.sub(vim.env.MYVIMRC, 0, -10)
  path = vim.fs.normalize(string.format("%s/lua/%s", init_path, path))

  local dir = uv.fs_scandir(path)
  if not dir then
    return function() end
  end
  return function()
    local n, t = uv.fs_scandir_next(dir)
    return n, t
  end
end

M.load_dir = function(tbl, path)
  assert(tbl, "tbl can't be nil")
  for f, t in M.walk_path(path) do
    if t == "file" and f ~= "init.lua" then
      local fname = string.format("%s.%s", string.gsub(path, "/", "."), string.sub(f, 0, -5))
      tbl = vim.tbl_deep_extend("force", tbl, require(fname))
    end
  end
  return tbl
end

M.load_config = function(tbl, path)
  assert(tbl, "tbl can't be nil")
  for f, t in M.walk_path(path) do
    if t == "file" and f ~= "init.lua" then
      local k = string.sub(f, 0, -5)
      local model = string.format("%s.%s", string.gsub(path, "/", "."), k)
      tbl[k] = require(model)
    end
  end
  return tbl
end

M = M.load_dir(M, "custom/utils")

return M
