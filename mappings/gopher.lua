return {
  plugin = true,
  n = {
    ["<leader>gaj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Go struct add json tag",
    },
    ["<leader>gay"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Go struct add yaml tag",
    },
    ["<leader>gmt"] = {
      "<cmd> GoMod tidy <CR>",
      "Go mod tidy",
    },
    ["<leader>gat"] = {
      "<cmd> GoTestAdd <CR>",
      "Go Add test",
    },
    ["<leader>gie"] = {
      "<cmd> GoIfErr <CR>",
      "Go if err block",
    },
  },
}
