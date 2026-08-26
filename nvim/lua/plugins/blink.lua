return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  version = "1.*",
  opts = {
    keymap = { preset = "super-tab" },
    appearance = { nerd_font_variant = "mono" },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    completion = {
      documentation = { auto_show = false },
      menu = {
        draw = {
          columns = {
            { "kind_icon" },
            { "label" },
            { "source" },
          },

          components = {
            source = {
              text = function(ctx)
                return ctx.item.detail or ""
              end,
              highlight = "BlinkCmpLabelDescription",
            },
          },
        },
      },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
