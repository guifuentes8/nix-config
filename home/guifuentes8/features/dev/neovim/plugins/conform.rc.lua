require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- Use a sub-list to run only the first available formatter
    javascript = { { "prettierd", } },
    typescript = { { "prettierd", } },
    javascriptreact = { { "prettierd", } },
    typescriptreact = { { "prettierd", } },
    html = { { "prettierd", } },
    css = { { "prettierd", } },
    json = { { "prettierd", } },
    yaml = { { "prettierd", } },
    graphql = { { "prettierd", } },
    markdown = { { "prettierd", } },
    svelte = { { "prettierd", } },

    nix = { "nixfmt" },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
    async = false,
  },
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
