return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    --[[ things you want to change go here]]
    size = function(term)
      if term.direction == "horizontal" then
        return 9
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.55
      end
    end,
    open_mapping = [[<c-\>]],
    start_in_insert = true,
    direction = "horizontal",
  },
}

