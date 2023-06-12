local opts = require "plugins.configs.cmp"
local cmp = require "cmp"
local cmp_buffer = require "cmp_buffer"

opts.mapping["<C-p>"] = nil
opts.mapping["<C-n>"] = nil

opts.mapping["<C-j>"] = cmp.mapping.select_next_item()
opts.mapping["<C-k>"] = cmp.mapping.select_prev_item()
opts.mapping["<TAB>"] = cmp.mapping.confirm {
  select = true,
  behavior = cmp.ConfirmBehavior.Replace,
}

opts.sorting = {
  comparators = {
    function(...)
      return cmp_buffer:compare_locality(...)
    end,
  },
}

opts.sources[3].option = {
  get_bufnrs = function()
    local bufs = {}
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      local size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
      if size < 1024 * 1024 then
        local ok, buf = pcall(vim.api.nvim_win_get_buf, win)
        if ok then
          bufs[buf] = true
        end
      end
    end
    return vim.tbl_keys(bufs)
  end,
}

return opts
