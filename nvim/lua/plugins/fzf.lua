return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>p", "<cmd>FzfLua files<cr>", desc = "Find files" },
    { "<leader>/", "<cmd>FzfLua live_grep<cr>", desc = "Live grep" },
    { "<leader>,", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
  },
}
