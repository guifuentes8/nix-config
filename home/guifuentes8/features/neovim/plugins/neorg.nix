{ unstable, ... }: {
  programs.nixvim.plugins.neorg = {
    enable = true;
    package = unstable.vimPlugins.neorg;
    lazyLoading = true;
    modules = {
      "core.defaults" = { __empty = null; };
      "core.concealer".config = { icon_preset = "diamond"; };
      "core.completion" = {
        config = {
          engine = "nvim-cmp";
          name = "[Norg]";
        };
      };
      "core.dirman" = {
        config = {
          workspaces = {
            personal = "/home/guifuentes8/Nextcloud/Notes/personal";
            journal = "/home/guifuentes8/Nextcloud/Notes/journal";
            work = "/home/guifuentes8/Nextcloud/Notes/neovim";
            study = "/home/guifuentes8/Nextcloud/Notes/study";
          };
          default_workspace = "personal";
        };
      };
      "core.esupports.metagen" = {
        config = {
          author = "guifuentes8";
          type = "auto";
          update_date = true;
        };
      };
      "core.export" = { __empty = null; };
      "core.export.markdown" = { config = { extensions = "all"; }; };
      "core.integrations.nvim-cmp" = {
        config = { sources = { name = "neorg"; }; };
      };
      "core.highlights" = { __empty = null; };
      "core.integrations.treesitter" = {
        config = {
          configure_parsers = true;
          install_parsers = true;
        };
      };
      "core.journal" = {
        config = {
          strategy = "flat";
          workspace = "journal";
        };
      };
      "core.keybinds" = {
        config = {
          default_keybinds = true;
          neorg_leader = ",";
        };
      };
      "core.looking-glass" = { __empty = null; };
      "core.presenter" = { config = { zen_mode = "zen-mode"; }; };
      "core.qol.toc" = { __empty = null; };
      "core.qol.todo_items" = { __empty = null; };
      "core.summary" = { config = { strategy = "by_path"; }; };
      "core.tangle" = { config = { report_on_empty = false; }; };
      "core.ui" = { __empty = null; };
    };
  };
}
