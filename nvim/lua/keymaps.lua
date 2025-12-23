local map = vim.keymap.set
local nmap_leader = function(suffix, rhs, desc) vim.keymap.set("n", "<Leader>" .. suffix, rhs, { desc = desc }) end
local xmap_leader = function(suffix, rhs, desc) vim.keymap.set("x", "<Leader>" .. suffix, rhs, { desc = desc }) end

-- Write the whole buffer to the curent file with `<Leader>w`
nmap_leader("w", "<CMD>w<CR>", "Write buffer")

-- Clear highlights on search when pressing <Esc> in normal mode
-- See `:help hlsearch`
map("n", "<Esc><Esc>", "<Esc>:nohlsearch<CR>", { desc = "Clear 'hlsearch'", silent = true })

-- Copy/paste with system clipboard
map({ "n", "x" }, "gy", '"+y', { desc = "Copy to system clipboard" })
map("n", "gp", '"+p', { desc = "Paste from system clipboard" })
map("n", "gP", '"+P', { desc = "Paste from system clipboard before the cursor" })
-- - Paste in Visual with `P` to not copy selected text (`:h v_P`)
map("x", "gp", '"+P', { desc = "Paste from system clipboard" })

-- l is for 'Language'. Common usage:
-- - `<Leader>ld` - show more diagnostic details in a floating window
-- - `<Leader>lr` - perform rename via LSP
-- - `<Leader>ls` - navigate to source definition of symbol under cursor
--
-- NOTE: most LSP mappings represent a more structured way of replacing built-in
-- LSP mappings (like `:h gra` and others). This is needed because `gr` is mapped
-- by an "replace" operator in 'mini.operators' (which is more commonly used).
local source_action = function()
  vim.lsp.buf.code_action({
    apply = true,
    context = {
      only = { "source" },
      diagnostics = {},
    },
  })
end
local formatting_cmd = '<Cmd>lua require("conform").format({lsp_fallback=true})<CR>'

nmap_leader("lA", source_action, "Source Actions")
nmap_leader("la", "<Cmd>lua vim.lsp.buf.code_action()<CR>", "Actions")
nmap_leader("ld", "<Cmd>lua vim.diagnostic.open_float()<CR>", "Diagnostic popup")
nmap_leader("lf", formatting_cmd, "Format")
nmap_leader("li", "<Cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation")
nmap_leader("lh", "<Cmd>lua vim.lsp.buf.hover()<CR>", "Hover")
nmap_leader("ln", "<Cmd>lua vim.lsp.buf.rename()<CR>", "Rename")
nmap_leader("lr", "<Cmd>lua vim.lsp.buf.references()<CR>", "References")
nmap_leader("ls", "<Cmd>lua vim.lsp.buf.definition()<CR>", "Source definition")
nmap_leader("lt", "<Cmd>lua vim.lsp.buf.type_definition()<CR>", "Type definition")

xmap_leader("lf", formatting_cmd, "Format selection")

-- o is for 'other'
nmap_leader("oT", "<Cmd>horizontal term<CR>", "Terminal (horizontal)")

-- e is for 'Explore' and 'Edit'
local edit_lua_file = function(filename)
  return string.format("<Cmd>edit %s/lua/%s<CR>", vim.fn.stdpath("config"), filename)
end

local explore_quickfix = function()
  for _, win_id in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    if vim.fn.getwininfo(win_id)[1].quickfix == 1 then
      return vim.cmd("cclose")
    end
  end
  vim.cmd("copen")
end

nmap_leader("eci", "<Cmd>edit $MYVIMRC<CR>", "init.lua")
nmap_leader("eck", edit_lua_file("keymaps.lua"), "Keymaps config")
nmap_leader("eco", edit_lua_file("options.lua"), "Options config")
nmap_leader("el", vim.diagnostic.setloclist, "Location List")
nmap_leader("eq", explore_quickfix, "Quickfix List")
map("t", "<C-o>", "<C-\\><C-n>", { desc = "Terminal Normal Mode" })
