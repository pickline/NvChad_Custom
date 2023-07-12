return {
  n = {
    ["<A-t>"] = {
      "<cmd>ToggleTerm <CR>",
      "open normal terminal",
    },
    ["<A-g>"] = {
      function()
        require("custom.utils").toggle_with_cmd "lazygit"
      end,
      "open lazygit terminal",
    },
  },
}
