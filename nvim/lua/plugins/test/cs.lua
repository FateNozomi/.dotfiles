return {
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "Issafalcon/neotest-dotnet",
    },
    opts = {
      adapters = {
        ["neotest-dotnet"] = {
          dap = {
            args = { justMyCode = false },
            adapter_name = "coreclr",
          },
          custom_attributes = {
            mstest = { "DynamicDataAttribute" },
          },
          dotnet_additional_args = {
            "--verbosity detailed",
          },
          discovery_root = "project",
        },
      },
    },
  },
}
