_G.Config.now_if_args(function()
  MiniDeps.add("seblyng/roslyn.nvim")

  vim.lsp.config["roslyn"] = {
    ---@type vim.lsp.Config
    cmd = {
      "/opt/roslyn/Microsoft.CodeAnalysis.LanguageServer",
      "--logLevel",
      "Information",
      "--extensionLogDirectory",
      vim.fs.joinpath(vim.uv.os_tmpdir(), "roslyn_ls/logs"),
      "--stdio",
    },
  }
end)
