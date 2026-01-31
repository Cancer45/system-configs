-- ~/.config/nvim
require("options")
require("plugins")
vim.cmd([[autocmd VimLeave * set guicursor=a:ver100]])
