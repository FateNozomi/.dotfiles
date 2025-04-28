return {
  {
    "seblyng/roslyn.nvim",
    ft = "cs",
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    opts = {
      config = {
        cmd = {
          "dotnet",
          "/opt/roslyn/Microsoft.CodeAnalysis.LanguageServer.dll",
          "--logLevel=Information",
          "--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.get_log_path()),
          "--stdio",
        },
      },
    },
  },
}
