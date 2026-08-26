return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      html = { "biome-check" },
      css = { "biome-check" },
      javascript = { "biome-check" },
      typescript = { "biome-check" },
      javascriptreact = { "biome-check" },
      typescriptreact = { "biome-check" },
      json = { "biome-check" },
      python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
    },
    formatter = {
      ["biome-check"] = {
        append_args = { "--unsafe" },
      },
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
