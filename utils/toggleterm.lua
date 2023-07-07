local Terminal = require("toggleterm.terminal").Terminal

local M = {}
local common_opts = {
  hiddent = true,
  direction = "float",
}

M.toggle_with_cmd = function(cmd)
  local terminal = Terminal:new(vim.tbl_deep_extend("force", { cmd = cmd }, common_opts))
  terminal:toggle()
end

return M
