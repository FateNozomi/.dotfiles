return {
  cmd = {
    "dotnet",
    "/opt/roslyn/Microsoft.CodeAnalysis.LanguageServer.dll",
    "--logLevel=Information",
    "--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.get_log_path()),
    "--stdio",
  },
  filetypes = { "cs" },
}
