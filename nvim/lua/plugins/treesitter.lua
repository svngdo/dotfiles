return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  branch = "main",
  config = function()
    local parsers = {
      -- coding
      "html",
      "css",
      "javascript",
      "typescript",
      "tsx",
      "python",
      "json",
      -- shell
      "bash",
      "fish",
      -- config
      "lua",
      "luadoc",
      "tmux",
      "toml",
      "yaml",
      "make",
      "vim",
      "vimdoc",
      -- misc
      "markdown",
      "markdown_inline",
      "regex",
    }

    require("nvim-treesitter").install(parsers)

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
      pattern = "*",
      callback = function(ev)
        local ft = vim.bo[ev.buf].filetype
        if ft == "" or not pcall(vim.treesitter.language.inspect, ft) then
          return
        end

        -- Highlighting
        vim.treesitter.start()

        -- Folds: computed by treesitter, all open by default (foldlevel 99)
        vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.wo[0][0].foldmethod = "expr"
        vim.wo[0][0].foldlevel = 99

        -- Indentation
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
