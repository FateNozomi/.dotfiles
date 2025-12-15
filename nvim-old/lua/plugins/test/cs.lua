return {
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      { "nsidorenco/neotest-vstest" },
    },
    opts = {
      adapters = {
        ["neotest-vstest"] = {},
      },
    },
  },
}
