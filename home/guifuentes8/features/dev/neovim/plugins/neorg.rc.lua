require("neorg").setup {
  load = {
    ["core.defaults"] = {},
    ["core.concealer"] = {},
    ["core.dirman"] = {
      config = {
        workspaces = {
          notes = "~/nix-config/home/guifuentes8/features/productivity/neorg/notes",
        },
        default_workspace = "notes",
      },
    },
  },
}

vim.wo.foldlevel = 99
vim.wo.conceallevel = 2
