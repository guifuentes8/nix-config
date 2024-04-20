require("neorg").setup {
  load = {
    ["core.defaults"] = {},
    ["core.concealer"] = { config = { icon_preset = "diamond" } },
    ["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
    ["core.dirman"] = {
      config = {
        workspaces = {
          personal = "~/nix-config/home/guifuentes8/features/productivity/neorg/personal",
          study = "~/nix-config/home/guifuentes8/features/productivity/neorg/study",
          neovim = "~/nix-config/home/guifuentes8/features/productivity/neorg/neovim",
          nix = "~/nix-config/home/guifuentes8/features/productivity/neorg/nix",
          journal = "~/nix-config/home/guifuentes8/features/productivity/neorg/journal",
          work = "~/nix-config/home/guifuentes8/features/productivity/neorg/work",

        },
        default_workspace = "personal",
      },
    },
    ["core.esupports.metagen"] = { config = { type = "auto", update_date = true } },
    ["core.export"] = {},
    ["core.export.markdown"] = { config = { extensions = "all" } },
    ["core.integrations.nvim-cmp"] = {},
    ["core.journal"] = {
      config = {
        strategy = "flat",
        workspace = "journal",
      },
    },
    ["core.keybinds"] = {
      config = {
        default_keybinds = true,
        neorg_leader = ",",
      },
    },
    ["core.looking-glass"] = {},
    ["core.presenter"] = {
      config = {
        zen_mode = "zen-mode"
      }
    },
    ["core.qol.toc"] = {},
    ["core.qol.todo_items"] = {},
    ["core.summary"] = {},
    ["core.tangle"] = { config = { report_on_empty = false } },
    ["core.ui.calendar"] = {},
  },
}

vim.wo.foldlevel = 99
vim.wo.conceallevel = 2
