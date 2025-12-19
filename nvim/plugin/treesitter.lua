_G.Config.now_if_args(function()
  MiniDeps.add({
    source = "nvim-treesitter/nvim-treesitter",
    -- Update tree-sitter parser after plugin is updated
    hooks = { post_checkout = function() vim.cmd("TSUpdate") end },
  })
  MiniDeps.add({
    source = "nvim-treesitter/nvim-treesitter-textobjects",
    -- Use `main` branch since `master` branch is frozen, yet still default
    -- It is needed for compatibility with 'nvim-treesitter' `main` branch
    checkout = "main",
  })

  -- Define languages which will have parsers installed and auto enabled
  local languages = {
    -- These are already pre-installed with Neovim
    "lua",
    "vimdoc",
    "markdown",
    -- Add here more languages with which you want to use tree-sitter
    -- To see available languages:
    -- - Execute `:=require('nvim-treesitter').get_available()`
    -- - Visit 'SUPPORTED_LANGUAGES.md' file at
    --   https://github.com/nvim-treesitter/nvim-treesitter/blob/main
    "c_sharp",
    "typescript",
  }
  local isnt_installed = function(lang) return #vim.api.nvim_get_runtime_file("parser/" .. lang .. ".*", false) == 0 end
  local to_install = vim.tbl_filter(isnt_installed, languages)
  if #to_install > 0 then
    require("nvim-treesitter").install(to_install)
  end

  -- Enable tree-sitter after opening a file for a target language
  local filetypes = {}
  for _, lang in ipairs(languages) do
    for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
      table.insert(filetypes, ft)
    end
  end
  local ts_start = function(ev) vim.treesitter.start(ev.buf) end
  _G.Config.new_autocmd("FileType", filetypes, ts_start, "Start tree-sitter")
end)

-- C Compiler for Windows
-- `winget install -e --id BrechtSanders.WinLibs.POSIX.UCRT`
-- $env:CC="gcc"
