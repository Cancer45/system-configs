-- ~/.config/nvim
require("options")
require("plugins")

-- return cursor to thin on exit
vim.cmd([[
    autocmd VimLeave * set guicursor=a:ver100
]])

-- disable nvim bg; fallback to terminal bg
vim.cmd([[
    highlight Normal ctermbg=NONE guibg=NONE
    highlight NormalNC ctermbg=NONE guibg=NONE
    highlight LineNr ctermbg=NONE guibg=NONE
    highlight CursorLineNr ctermbg=NONE guibg=NONE
]])
