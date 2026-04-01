-- Define config table to be able to pass data between scripts
_G.Config = {}

vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

local misc = require("mini.misc")
Config.now = function(f) misc.safely("now", f) end
Config.later = function(f) misc.safely("later", f) end
Config.now_if_args = vim.fn.argc(-1) > 0 and Config.now or Config.later
Config.on_event = function(ev, f) misc.safely("event:" .. ev, f) end
Config.on_filetype = function(ft, f) misc.safely("filetype:" .. ft, f) end

-- Define custom autocommand group and helper to create an autocommand.
local gr = vim.api.nvim_create_augroup("custom-config", {})
Config.new_autocmd = function(event, pattern, callback, desc)
  local opts = { group = gr, pattern = pattern, callback = callback, desc = desc }
  vim.api.nvim_create_autocmd(event, opts)
end

-- Define custom `vim.pack.add()` hook helper. See `:h vim.pack-events`.
Config.on_packchanged = function(plugin_name, kinds, callback, desc)
  local f = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if not (name == plugin_name and vim.tbl_contains(kinds, kind)) then
      return
    end
    if not ev.data.active then
      vim.cmd.packadd(plugin_name)
    end
    callback()
  end
  Config.new_autocmd("PackChanged", "*", f, desc)
end

require("options")
require("keymaps")

if vim.fn.has("win32") == 1 then
  vim.opt.shell = "pwsh"
  vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command "
    .. "[Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();"
    .. "$PSDefaultParameterValues['Out-File:Encoding']='utf8';"
    .. "$PSStyle.OutputRendering = 'PlainText';"
  vim.opt.shellpipe = "> %s 2>&1"
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""
end

vim.cmd("packadd nvim.undotree")
