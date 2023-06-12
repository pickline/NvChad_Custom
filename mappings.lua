---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>ds"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar",
    },
    ["<leader>dc"] = {
      function()
        require("dap").continue()
      end,
      "Debug go test continue",
    },
  },
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dt"] = {
      function()
        require("dap-go").debug_test()
      end,
      "Debug go test",
    },
    ["<leader>dl"] = {
      function()
        require("dap-go").debug_last()
      end,
      "Debug last go test",
    },
  },
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gtj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Go struct add json tag",
    },
    ["<leader>gty"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Go struct add yaml tag",
    },
    ["<leader>gmt"] = {
      "<cmd> GoMod tidy <CR>",
      "Go mod tidy",
    },
    ["<leader>gta"] = {
      "<cmd> GoTestAdd <CR>",
      "Go Add test",
    },
    ["<leader>gie"] = {
      "<cmd> GoIfErr <CR>",
      "Go if err block",
    },
  },
}
-- more keybinds!

return M
