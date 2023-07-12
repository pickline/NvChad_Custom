local M = {}
local common_opts = {
  hiddent = true,
  direction = "float",
}
M.toggle_with_cmd = function(cmd)
  local ok, terminal = pcall(require, "toggleterm.terminal")
  if ok then
    local term = terminal.Terminal:new(vim.tbl_deep_extend("force", { cmd = cmd }, common_opts))
    term:toggle()
  end
end

return M
