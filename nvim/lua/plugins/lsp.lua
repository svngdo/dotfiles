return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile", "VeryLazy" },
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    { "j-hui/fidget.nvim", config = true },
    { "folke/lazydev.nvim", ft = "lua", config = true },
  },
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_pending = " ",
          package_installed = " ",
          package_uninstalled = " ",
        },
      },
      max_concurrent_installers = 10,
    })

    require("mason-lspconfig").setup({
      automatic_enable = true,
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "html",
        "cssls",
        "ts_ls",
        "tailwindcss",
        "ty",
        "ruff",
        "lua_ls",
        "jsonls",
        "yamlls",
        "dockerls",
        "bashls",
        "stylua",
        "biome",
      },
    })
    require("mason-tool-installer").run_on_start()

    -- groups created once, so they don't get wiped every time a buffer attaches
    local attach_group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true })
    local detach_group = vim.api.nvim_create_augroup("UserLspDetach", { clear = true })
    local hl_group = vim.api.nvim_create_augroup("UserLspHighlight", { clear = true })

    -- runs every time an LSP attaches to a buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      group = attach_group,
      callback = function(ev)
        local buf = ev.buf
        local function map(keys, func, desc, mode, opts)
          mode = mode or "n"
          opts = opts or {}
          vim.keymap.set(mode, keys, func, vim.tbl_extend("force", { buffer = buf, desc = desc }, opts))
        end

        -- Neovim 0.11+ already ships default keymaps:
        -- K (hover)
        -- grn (rename)
        -- gra (code action)
        -- grr (references)
        -- gri (implementation)
        -- gO (doc symbols)
        -- Only override where FzfLua gives a better picker experience
        map("gd", "<cmd>FzfLua lsp_definitions<cr>", "Go to definition")
        map("gD", "<cmd>FzfLua lsp_declarations<cr>", "Go to declaration")
        map("gr", "<cmd>FzfLua lsp_references<cr>", "References", nil, { nowait = true })
        map("gi", "<cmd>FzfLua lsp_implementations<cr>", "Implementations")
        map("gt", "<cmd>FzfLua lsp_typedefs<cr>", "Type definitions")
        map("gO", "<cmd>FzfLua lsp_document_symbols<cr>", "Document symbols")
        map("gW", "<cmd>FzfLua lsp_workspace_symbols<cr>", "Workspace symbols")
        map("<leader>rn", vim.lsp.buf.rename, "Rename")
        map("<leader>ca", vim.lsp.buf.code_action, "Code Action", { "n", "x" })

        local client = vim.lsp.get_clients({ id = ev.data.client_id })[1]

        -- Defer hover to `ty` since ruff doesn't provide useful hover/type info
        if client and client.name == "ruff" then
          client.server_capabilities.hoverProvider = false
        end

        if not client or not client:supports_method("textDocument/documentHighlight") then
          return
        end

        -- highlight symbol under cursor when idle, clear when cursor moves
        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
          buffer = buf,
          group = hl_group,
          callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
          buffer = buf,
          group = hl_group,
          callback = vim.lsp.buf.clear_references,
        })

        -- clean up this buffer's autocmds when its LSP detaches
        vim.api.nvim_create_autocmd("LspDetach", {
          buffer = buf,
          group = detach_group,
          callback = function()
            vim.lsp.buf.clear_references()
            vim.api.nvim_clear_autocmds({ group = hl_group, buffer = buf })
            vim.api.nvim_clear_autocmds({ group = detach_group, buffer = buf })
          end,
        })
      end,
    })

    -- diagnostics UI
    vim.diagnostic.config({
      underline = true,
      severity_sort = true,
      update_in_insert = false,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.INFO] = "",
          [vim.diagnostic.severity.HINT] = "",
        },
      },
      virtual_text = { prefix = "●", spacing = 4 },
      float = { source = true },
      jump = { float = true },
    })
  end,
}
