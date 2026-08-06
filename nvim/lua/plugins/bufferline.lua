return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      mode = "buffers",
      always_show_bufferline = true,
      diagnostics = "nvim_lsp",
      separator_style = "thin", -- thin | thick | slant | slope | padded_slant | padded_slope
      show_buffer_close_icons = false,
      show_close_icon = false,
      offsets = {
        {
          filetype = "NvimTree",
          text = function()
            return vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
          end,
          highlight = "NvimTreeNormal", -- exact match to tree bg
          text_align = "left",
          separator = false, -- removes the divider between offset and tree
          padding = 0,
        },
      },
    },
  },
  keys = {
    -- { "<S-l>", "<cmd>tabnext<cr>", desc = "Next buffer" },
    -- { "<S-h>", "<cmd>tabprevious<cr>", desc = "Prev buffer" },
    -- { "<A-l>", "<cmd>tabmove +1<cr>", desc = "Move buffer right" },
    -- { "<A-h>", "<cmd>tabmove -1<cr>", desc = "Move buffer left" },
    -- { "<leader>tn", "<cmd>tabnew<cr>", desc = "New tab" },
    -- { "<leader>x", "<cmd>tabclose<cr>", desc = "Close tab" },
    -- { "<leader>to", "<cmd>tabonly<cr>", desc = "Close other tabs" },
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
    { "<A-l>", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer right" },
    { "<A-h>", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer left" },
    { "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Pin buffer" },
    { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Close other buffers" },
    { "<leader>bd", "<cmd>bdelete<cr>", desc = "Delete buffer" },
    { "<leader>bD", "<cmd>BufferLineGroupClose ungrouped<cr>", desc = "Close non-pinned buffers" },
    { "<leader>bs", "<cmd>BufferLineSortByDirectory<cr>", desc = "Sort by directory" },
    { "<leader>be", "<cmd>BufferLineSortByExtension<cr>", desc = "Sort by extension" },
  },
}
