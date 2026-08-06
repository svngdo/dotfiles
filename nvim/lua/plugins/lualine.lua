return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      theme = "auto",
      globalstatus = true, -- single statusline across all splits
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {},
    },
    sections = {
      lualine_b = {
        {
          "branch",
          icon = "",
        },
        -- {
        --   function()
        --     return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
        --   end,
        --   icon = "",
        -- },
      },
      lualine_c = {
        {
          "filename",
          path = 1, -- relative path
          shorting_target = 40,
          -- symbols = { modified = "●", readonly = "", unnamed = "" },
        },
      },
      lualine_x = {
        {
          "diagnostics",
          sources = { "nvim_diagnostic" },
          sections = { "error", "warn" },
          symbols = {
            error = " ",
            warn = " ",
          },
        },
      },
    },
  },
}
