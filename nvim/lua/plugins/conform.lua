return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      html = { "biome" },
      css = { "biome" },
      javascript = { "biome" },
      typescript = { "biome" },
      javascriptreact = { "biome" },
      typescriptreact = { "biome" },
      json = { "biome" },
      python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
    },
    format_on_save = { timeout_ms = 1000, lsp_format = "fallback" },
  },
  keys = {
    {
      "<leader>fm",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      desc = "Format file",
    },
  },
}
