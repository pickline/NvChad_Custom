local M = {}

M.hop = {
  case_insensitive = true,
  multi_windows = true,
}

M.toggleterm = {
  direction = "float",
  float_opts = {
    border = "single",
  },
  shade_terminals = false,
}

M.auto_session = {
  auto_session_enable_last_session = true,
  -- auto_session_enabled = false,
}

M.session_lens = {
  path_display = { "shorten" },
}

return M
