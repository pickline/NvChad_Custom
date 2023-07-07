local M = {}
local Terminal = require("toggleterm.terminal").Terminal

local common_opts = {
  hiddent = true,
  directioni = "float",
}

M.toggle_with_term = function(cmd)
  local terminal = Terminal:new(vim.tbl_deep_extend("force", { cmd = cmd }, common_opts))
  terminal:toggle()
end

return M
