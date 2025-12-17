local now, later = MiniDeps.now, MiniDeps.later

local map = vim.keymap.set
local nmap_leader = function(suffix, rhs, desc) vim.keymap.set("n", "<Leader>" .. suffix, rhs, { desc = desc }) end
local xmap_leader = function(suffix, rhs, desc) vim.keymap.set("x", "<Leader>" .. suffix, rhs, { desc = desc }) end

_G.Config.leader_group_clues = {
  { mode = "n", keys = "<Leader>b", desc = "+Buffer" },
  { mode = "n", keys = "<Leader>e", desc = "+Explore/Edit" },
  { mode = "n", keys = "<Leader>ec", desc = "+Config" },
  { mode = "n", keys = "<Leader>f", desc = "+Find" },
  { mode = "n", keys = "<Leader>g", desc = "+Git" },
  { mode = "n", keys = "<Leader>l", desc = "+Language" },
  { mode = "n", keys = "<Leader>m", desc = "+Map" },
  { mode = "n", keys = "<Leader>o", desc = "+Other" },
  { mode = "n", keys = "<Leader>s", desc = "+Session" },
  { mode = "n", keys = "<Leader>t", desc = "+Terminal" },
  { mode = "n", keys = "<Leader>v", desc = "+Visits" },

  { mode = "x", keys = "<Leader>g", desc = "+Git" },
  { mode = "x", keys = "<Leader>l", desc = "+Language" },
}

-- # Primary

now(function()
  require("mini.icons").setup()
  later(MiniIcons.tweak_lsp_kind)
end)

now(function()
  require("mini.notify").setup()
  nmap_leader("en", "<Cmd>lua MiniNotify.show_history()<CR>", "Notifications")
end)

now(function()
  require("mini.sessions").setup()

  -- s is for 'Session'. Common usage:
  -- - `<Leader>sn` - start new session
  -- - `<Leader>sr` - read previously started session
  -- - `<Leader>sd` - delete previously started session
  local session_new = 'MiniSessions.write(vim.fn.input("Session name: "))'
  nmap_leader("sd", '<Cmd>lua MiniSessions.select("delete")<CR>', "Delete")
  nmap_leader("sn", "<Cmd>lua " .. session_new .. "<CR>", "New")
  nmap_leader("sr", '<Cmd>lua MiniSessions.select("read")<CR>', "Read")
  nmap_leader("sw", "<Cmd>lua MiniSessions.write()<CR>", "Write current")
end)

now(function() require("mini.starter").setup({ header = "" }) end)

now(function() require("mini.statusline").setup() end)

-- # Secondary

later(function() require("mini.extra").setup() end)

later(function()
  local ai = require("mini.ai")
  ai.setup({
    custom_textobjects = {
      -- Make `aB` / `iB` act on around/inside whole *b*uffer
      B = MiniExtra.gen_ai_spec.buffer(),
      -- For more complicated textobjects that require structural awareness,
      -- use tree-sitter. This example makes `aF`/`iF` mean around/inside function
      -- definition (not call). See `:h MiniAi.gen_spec.treesitter()` for details.
      F = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
    },

    -- 'mini.ai' by default mostly mimics built-in search behavior: first try
    -- to find textobject covering cursor, then try to find to the right.
    -- Although this works in most cases, some are confusing. It is more robust to
    -- always try to search only covering textobject and explicitly ask to search
    -- for next (`an`/`in`) or last (`al`/`il`).
    -- Try this. If you don't like it - delete next line and this comment.
    search_method = "cover",
  })
end)

later(function()
  require("mini.bufremove").setup()

  -- b is for 'Buffer'. Common usage:
  -- - `<Leader>bs` - create scratch (temporary) buffer
  -- - `<Leader>ba` - navigate to the alternative buffer
  -- - `<Leader>bw` - wipeout (fully delete) current buffer
  local new_scratch_buffer = function() vim.api.nvim_win_set_buf(0, vim.api.nvim_create_buf(true, true)) end
  nmap_leader("ba", "<Cmd>b#<CR>", "Alternate")
  nmap_leader("bd", "<Cmd>lua MiniBufremove.delete()<CR>", "Delete")
  nmap_leader("bD", "<Cmd>lua MiniBufremove.delete(0, true)<CR>", "Delete!")
  nmap_leader("bs", new_scratch_buffer, "Scratch")
  nmap_leader("bw", "<Cmd>lua MiniBufremove.wipeout()<CR>", "Wipeout")
  nmap_leader("bW", "<Cmd>lua MiniBufremove.wipeout(0, true)<CR>", "Wipeout!")
end)

later(function()
  local miniclue = require("mini.clue")
  miniclue.setup({
    clues = {
      Config.leader_group_clues,
      miniclue.gen_clues.builtin_completion(),
      miniclue.gen_clues.g(),
      miniclue.gen_clues.marks(),
      miniclue.gen_clues.registers(),
      -- This creates a submode for window resize mappings. Try the following:
      -- - Press `<C-w>s` to make a window split.
      -- - Press `<C-w>+` to increase height. Clue window still shows clues as if
      --   `<C-w>` is pressed again. Keep pressing just `+` to increase height.
      --   Try pressing `-` to decrease height.
      -- - Stop submode either by `<Esc>` or by any key that is not in submode.
      miniclue.gen_clues.windows({ submode_resize = true }),
      miniclue.gen_clues.z(),
    },
    -- Explicitly opt-in for set of common keys to trigger clue window
    triggers = {
      { mode = "n", keys = "<Leader>" }, -- Leader triggers
      { mode = "x", keys = "<Leader>" },
      { mode = "n", keys = "[" }, -- mini.bracketed
      { mode = "n", keys = "]" },
      { mode = "x", keys = "[" },
      { mode = "x", keys = "]" },
      { mode = "i", keys = "<C-x>" }, -- Built-in completion
      { mode = "n", keys = "g" }, -- `g` key
      { mode = "x", keys = "g" },
      { mode = "n", keys = "'" }, -- Marks
      { mode = "n", keys = "`" },
      { mode = "x", keys = "'" },
      { mode = "x", keys = "`" },
      { mode = "n", keys = '"' }, -- Registers
      { mode = "x", keys = '"' },
      { mode = "i", keys = "<C-r>" },
      { mode = "c", keys = "<C-r>" },
      { mode = "n", keys = "<C-w>" }, -- Window commands
      { mode = "n", keys = "z" }, -- `z` key
      { mode = "x", keys = "z" },
    },
    window = {
      delay = 200,
    },
  })
end)

-- Comment lines. Provides functionality to work with commented lines.
-- Uses `:h 'commentstring'` option to infer comment structure.
-- Example usage:
-- - `gcip` - toggle comment (`gc`) *i*inside *p*aragraph
-- - `vapgc` - *v*isually select *a*round *p*aragraph and toggle comment (`gc`)
-- - `gcgc` - uncomment (`gc`, operator) comment block at cursor (`gc`, textobject)
--
-- The built-in `:h commenting` is based on 'mini.comment'. Yet this module is
-- still enabled as it provides more customization opportunities.
later(function() require("mini.comment").setup() end)

-- Work with diff hunks that represent the difference between the buffer text and
-- some reference text set by a source. Default source uses text from Git index.
-- Also provides summary info used in developer section of 'mini.statusline'.
-- Example usage:
-- - `ghip` - apply hunks (`gh`) within *i*nside *p*aragraph
-- - `gHG` - reset hunks (`gH`) from cursor until end of buffer (`G`)
-- - `ghgh` - apply (`gh`) hunk at cursor (`gh`)
-- - `gHgh` - reset (`gH`) hunk at cursor (`gh`)
-- - `<Leader>go` - toggle overlay
--
-- See also:
-- - `:h MiniDiff-overview` - overview of how module works
-- - `:h MiniDiff-diff-summary` - available summary information
-- - `:h MiniDiff.gen_source` - available built-in sources
later(function()
  require("mini.diff").setup()
  nmap_leader("go", "<Cmd>lua MiniDiff.toggle_overlay()<CR>", "Toggle overlay")
end)

later(function()
  require("mini.files").setup({ windows = { preview = true } })

  -- Add common bookmarks for every explorer. Example usage inside explorer:
  -- - `'c` to navigate into your config directory
  -- - `g?` to see available bookmarks
  local add_marks = function()
    MiniFiles.set_bookmark("c", vim.fn.stdpath("config"), { desc = "Config" })
    local minideps_plugins = vim.fn.stdpath("data") .. "/site/pack/deps/opt"
    MiniFiles.set_bookmark("p", minideps_plugins, { desc = "Plugins" })
    MiniFiles.set_bookmark("w", vim.fn.getcwd, { desc = "Working directory" })
  end
  _G.Config.new_autocmd("User", "MiniFilesExplorerOpen", add_marks, "Add bookmarks")

  -- e is for 'Explore' and 'Edit'. Common usage:
  -- - `<Leader>ed` - open explorer at current working directory
  -- - `<Leader>ef` - open directory of current file (needs to be present on disk)
  local explore_at_file = "<Cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>"
  nmap_leader("ed", "<Cmd>lua MiniFiles.open()<CR>", "Directory")
  nmap_leader("ef", explore_at_file, "File directory")

  local toggle_explore = function()
    if not MiniFiles.close() then
      local buf_name = vim.api.nvim_buf_get_name(0)
      if vim.fn.filereadable(buf_name) then
        MiniFiles.open(buf_name)
      else
        MiniFiles.open()
      end
    end
  end

  map("n", "-", toggle_explore, { desc = "File Explorer" })
end)

-- Git integration for more straightforward Git actions based on Neovim's state.
-- It is not meant as a fully featured Git client, only to provide helpers that
-- integrate better with Neovim. Example usage:
-- - `<Leader>gs` - show information at cursor
-- - `<Leader>gd` - show unstaged changes as a patch in separate tabpage
-- - `<Leader>gL` - show Git log of current file
-- - `:Git help git` - show output of `git help git` inside Neovim
--
-- See also:
-- - `:h MiniGit-examples` - examples of common setups
-- - `:h :Git` - more details about `:Git` user command
-- - `:h MiniGit.show_at_cursor()` - what information at cursor is shown
later(function()
  require("mini.git").setup()

  -- g is for 'Git'. Common usage:
  -- - `<Leader>gs` - show information at cursor
  -- - `<Leader>gd` - show unstaged changes as a patch in separate tabpage
  -- - `<Leader>gL` - show Git log of current file
  local git_log_cmd = [[Git log --pretty=format:\%h\ \%as\ │\ \%s --topo-order]]
  local git_log_buf_cmd = git_log_cmd .. " --follow -- %"

  nmap_leader("ga", "<Cmd>Git diff --cached<CR>", "Added diff")
  nmap_leader("gA", "<Cmd>Git diff --cached -- %<CR>", "Added diff buffer")
  nmap_leader("gc", "<Cmd>Git commit<CR>", "Commit")
  nmap_leader("gC", "<Cmd>Git commit --amend<CR>", "Commit amend")
  nmap_leader("gd", "<Cmd>Git diff<CR>", "Diff")
  nmap_leader("gD", "<Cmd>Git diff -- %<CR>", "Diff buffer")
  nmap_leader("gl", "<Cmd>" .. git_log_cmd .. "<CR>", "Log")
  nmap_leader("gL", "<Cmd>" .. git_log_buf_cmd .. "<CR>", "Log buffer")
  nmap_leader("gs", "<Cmd>lua MiniGit.show_at_cursor()<CR>", "Show at cursor")

  xmap_leader("gs", "<Cmd>lua MiniGit.show_at_cursor()<CR>", "Show at selection")
end)

-- Highlight patterns in text. Like `TODO`/`NOTE` or color hex codes.
-- Example usage:
-- - `:Pick hipatterns` - pick among all highlighted patterns
--
-- See also:
-- - `:h MiniHipatterns-examples` - examples of common setups
later(function()
  local hipatterns = require("mini.hipatterns")
  local hi_words = MiniExtra.gen_highlighter.words
  hipatterns.setup({
    highlighters = {
      -- Highlight a fixed set of common words. Will be highlighted in any place,
      -- not like "only in comments".
      fixme = hi_words({ "FIXME", "Fixme", "fixme" }, "MiniHipatternsFixme"),
      hack = hi_words({ "HACK", "Hack", "hack" }, "MiniHipatternsHack"),
      todo = hi_words({ "TODO", "Todo", "todo" }, "MiniHipatternsTodo"),
      note = hi_words({ "NOTE", "Note", "note" }, "MiniHipatternsNote"),

      -- Highlight hex color string (#aabbcc) with that color as a background
      hex_color = hipatterns.gen_highlighter.hex_color(),
    },
  })
end)

-- Visualize and work with indent scope. It visualizes indent scope "at cursor"
-- with animated vertical line. Provides relevant motions and textobjects.
-- Example usage:
-- - `cii` - *c*hange *i*nside *i*ndent scope
-- - `Vaiai` - *V*isually select *a*round *i*ndent scope and then again
--   reselect *a*round new *i*indent scope
-- - `[i` / `]i` - navigate to scope's top / bottom
--
-- See also:
-- - `:h MiniIndentscope.gen_animation` - available animation rules
later(function() require("mini.indentscope").setup() end)

-- Window with text overview. It is displayed on the right hand side. Can be used
-- for quick overview and navigation. Hidden by default. Example usage:
-- - `<Leader>mt` - toggle map window
-- - `<Leader>mf` - focus on the map for fast navigation
-- - `<Leader>ms` - change map's side (if it covers something underneath)
--
-- See also:
-- - `:h MiniMap.gen_encode_symbols` - list of symbols to use for text encoding
-- - `:h MiniMap.gen_integration` - list of integrations to show in the map
--
-- NOTE: Might introduce lag on very big buffers (10000+ lines)
later(function()
  local minimap = require("mini.map")
  minimap.setup({
    -- Use Braille dots to encode text
    symbols = { encode = minimap.gen_encode_symbols.dot("4x2") },
    -- Show built-in search matches, 'mini.diff' hunks, and diagnostic entries
    integrations = {
      minimap.gen_integration.builtin_search(),
      minimap.gen_integration.diff(),
      minimap.gen_integration.diagnostic(),
    },
  })

  -- Map built-in navigation characters to force map refresh
  for _, key in ipairs({ "n", "N", "*", "#" }) do
    local rhs = key
      -- Also open enough folds when jumping to the next match
      .. "zv"
      .. "<Cmd>lua MiniMap.refresh({}, { lines = false, scrollbar = false })<CR>"
    vim.keymap.set("n", key, rhs)
  end

  -- m is for 'Map'. Common usage:
  -- - `<Leader>mt` - toggle map from 'mini.map' (closed by default)
  -- - `<Leader>mf` - focus on the map for fast navigation
  -- - `<Leader>ms` - change map's side (if it covers something underneath)
  nmap_leader("mf", "<Cmd>lua MiniMap.toggle_focus()<CR>", "Focus (toggle)")
  nmap_leader("mr", "<Cmd>lua MiniMap.refresh()<CR>", "Refresh")
  nmap_leader("ms", "<Cmd>lua MiniMap.toggle_side()<CR>", "Side (toggle)")
  nmap_leader("mt", "<Cmd>lua MiniMap.toggle()<CR>", "Toggle")
end)

later(function()
  -- Create pairs not only in Insert, but also in Command line mode
  require("mini.pairs").setup({ modes = { command = true } })
end)

later(function()
  require("mini.pick").setup({
    mappings = { choose_marked = "<C-q>" },
    window = { config = { width = vim.o.columns } },
  })

  -- f is for 'Fuzzy Find'. Common usage:
  -- - `<Leader>ff` - find files; for best performance requires `ripgrep`
  -- - `<Leader>fg` - find inside files; requires `ripgrep`
  -- - `<Leader>fh` - find help tag
  -- - `<Leader>fr` - resume latest picker
  -- - `<Leader>fv` - all visited paths; requires 'mini.visits'
  --
  -- All these use 'mini.pick'. See `:h MiniPick-overview` for an overview.
  local pick_added_hunks_buf = '<Cmd>Pick git_hunks path="%" scope="staged"<CR>'
  local pick_workspace_symbols_live = '<Cmd>Pick lsp scope="workspace_symbol_live"<CR>'

  nmap_leader("f/", '<Cmd>Pick history scope="/"<CR>', '"/" history')
  nmap_leader("f:", '<Cmd>Pick history scope=":"<CR>', '":" history')
  nmap_leader("fa", '<Cmd>Pick git_hunks scope="staged"<CR>', "Added hunks (all)")
  nmap_leader("fA", pick_added_hunks_buf, "Added hunks (buf)")
  nmap_leader("fb", "<Cmd>Pick buffers<CR>", "Buffers")
  nmap_leader("fc", "<Cmd>Pick git_commits<CR>", "Commits (all)")
  nmap_leader("fC", '<Cmd>Pick git_commits path="%"<CR>', "Commits (buf)")
  nmap_leader("fd", '<Cmd>Pick diagnostic scope="all"<CR>', "Diagnostic workspace")
  nmap_leader("fD", '<Cmd>Pick diagnostic scope="current"<CR>', "Diagnostic buffer")
  nmap_leader("ff", "<Cmd>Pick files<CR>", "Files")
  nmap_leader("fg", "<Cmd>Pick grep_live<CR>", "Grep live")
  nmap_leader("fG", '<Cmd>Pick grep pattern="<cword>"<CR>', "Grep current word")
  nmap_leader("fh", "<Cmd>Pick help<CR>", "Help tags")
  nmap_leader("fH", "<Cmd>Pick hl_groups<CR>", "Highlight groups")
  nmap_leader("fl", '<Cmd>Pick buf_lines scope="all"<CR>', "Lines (all)")
  nmap_leader("fL", '<Cmd>Pick buf_lines scope="current"<CR>', "Lines (buf)")
  nmap_leader("fm", "<Cmd>Pick git_hunks<CR>", "Modified hunks (all)")
  nmap_leader("fM", '<Cmd>Pick git_hunks path="%"<CR>', "Modified hunks (buf)")
  nmap_leader("fr", "<Cmd>Pick resume<CR>", "Resume")
  nmap_leader("fR", '<Cmd>Pick lsp scope="references"<CR>', "References (LSP)")
  nmap_leader("fs", pick_workspace_symbols_live, "Symbols workspace (live)")
  nmap_leader("fS", '<Cmd>Pick lsp scope="document_symbol"<CR>', "Symbols document")
  nmap_leader("fv", '<Cmd>Pick visit_paths cwd=""<CR>', "Visit paths (all)")
  nmap_leader("fV", "<Cmd>Pick visit_paths<CR>", "Visit paths (cwd)")
end)

later(function() require("mini.splitjoin").setup({ mappings = { toggle = "gS" } }) end)

later(function() require("mini.surround").setup() end)

later(function()
  require("mini.trailspace").setup()

  -- o is for 'Other'
  nmap_leader("ot", "<Cmd>lua MiniTrailspace.trim()<CR>", "Trim trailspace")
end)

later(function()
  require("mini.visits").setup()
  local make_pick_core = function(cwd, desc)
    return function()
      local sort_latest = MiniVisits.gen_sort.default({ recency_weight = 1 })
      local local_opts = { cwd = cwd, filter = "core", sort = sort_latest }
      MiniExtra.pickers.visit_paths(local_opts, { source = { name = desc } })
    end
  end

  -- v is for 'Visits'. Common usage:
  -- - `<Leader>vv` - add    "core" label to current file.
  -- - `<Leader>vV` - remove "core" label to current file.
  -- - `<Leader>vc` - pick among all files with "core" label.
  nmap_leader("vc", make_pick_core("", "Core visits (all)"), "Core visits (all)")
  nmap_leader("vC", make_pick_core(nil, "Core visits (cwd)"), "Core visits (cwd)")
  nmap_leader("vv", '<Cmd>lua MiniVisits.add_label("core")<CR>', 'Add "core" label')
  nmap_leader("vV", '<Cmd>lua MiniVisits.remove_label("core")<CR>', 'Remove "core" label')
  nmap_leader("vl", "<Cmd>lua MiniVisits.add_label()<CR>", "Add label")
  nmap_leader("vL", "<Cmd>lua MiniVisits.remove_label()<CR>", "Remove label")
end)
