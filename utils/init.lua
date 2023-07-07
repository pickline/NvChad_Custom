local M = {}

M.walk_path = function(path)
  local init_path = string.sub(vim.env.MYVIMRC, 0, -10)
  path = vim.fs.normalize(string.format("%s/lua/%s", init_path, path))

  local dir = vim.loop.fs_scandir(path)
  if not dir then
    return function() end
  end
  return function()
    local n, t = vim.loop.fs_scandir_next(dir)
    return n, t
  end
end

M.require_dir = function(tbl, path)
  assert(tbl, "tbl can't be nil")
  for f, t in M.walk_path(path) do
    if t == "file" and f ~= "init.lua" then
      local fname = string.format("%s.%s", string.gsub(path, "/", "."), string.sub(f, 0, -5))
      tbl = vim.tbl_deep_extend("force", tbl, require(fname))
    end
  end
  return tbl
end

M = M.require_dir(M, "custom/utils")
return M
