vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4

vim.cmd([[set errorformat=%E%f(%l\\,%c):\ %trror\ %m\ [%.%#],
                         \%W%f(%l\\,%c):\ %tarning\ %m\ [%.%#],
                         \%-G%.%#]])
