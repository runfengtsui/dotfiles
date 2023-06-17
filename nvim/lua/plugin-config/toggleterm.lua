require("toggleterm").setup{
    -- size can be a number or function which is passed the current terminal
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
}

