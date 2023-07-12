return {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-s>"] = { "<CMD> w <CR>", "save file", opts = { nowait = true } },
    ["<C-x>"] = { "<CMD> q <CR>", "quit", opts = { nowait = true } },
    ["<C-b>"] = { "<CMD> bd<CR>", "close buffer", opts = { nowait = true } },
  },
  i = {
    ["<C-s>"] = { "<CMD> w <CR>", "save file", opts = { nowait = true } },
  },
}
