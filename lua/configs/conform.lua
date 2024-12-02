local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettierd" },
    scss = { "prettierd" },
    html = { "prettierd" },
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    vue = { "prettierd" },
    yaml = { "prettierd" },
    python = { "black" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 2500,
    lsp_fallback = true,
  },
}

return options
