require("config.settings")
require("config.lazy")
require("config.keymaps")

vim.opt.title = true
vim.opt.titlestring = "%{fnamemodify(getcwd(), ':t')}"

vim.cmd.colorscheme("nightfox")
require("config.lsp")
