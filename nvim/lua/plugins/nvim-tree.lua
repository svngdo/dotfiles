return {
  "nvim-tree/nvim-tree.lua",
  cmd = "NvimTreeToggle",
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file tree" },
  },
  opts = {
    notify = {
      threshold = vim.log.levels.WARN, -- silences "properly removed" and similar INFO messages
    },
    filters = {
      dotfiles = false,
      git_ignored = false,
    },
    disable_netrw = true,
    hijack_cursor = true,
    sync_root_with_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = false,
    },
    sort = {
      sorter = "case_sensitive",
    },
    view = {
      width = 40,
      preserve_window_proportions = true,
    },
    renderer = {
      group_empty = true,
      root_folder_label = false,
      -- root_folder_label = ":~", -- show path relative to home
      highlight_git = true,
      indent_markers = { enable = true },
      icons = {
        glyphs = {
          default = "󰈚",
          folder = {
            default = "",
            empty = "",
            empty_open = "",
            open = "",
            symlink = "",
          },
          git = { unmerged = "" },
        },
      },
    },
    actions = {
      trash = {
        cmd = "trash",
      },
    },
    on_attach = function(bufnr)
      local api = require("nvim-tree.api")

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- load all the default nvim-tree mappings first
      api.map.on_attach.default(bufnr)

      -- then override d/D
      vim.keymap.set("n", "d", api.fs.trash, opts("Delete to trash"))
      vim.keymap.set("n", "D", api.fs.remove, opts("Delete permanently"))
    end,
  },
}
