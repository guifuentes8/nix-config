{ ... }: {
  programs.nixvim.plugins = {
    nui.enable = true;
    notify.enable = true;
    noice = {
      enable = true;
      settings = {
        cmdline = {
          enabled = true;
          # view = "cmdline_popup";
          format = {
            cmdline = {
              icon = " ";
              lang = "vim";
              pattern = "^:";
            };
            filter = {
              icon = "$";
              lang = "bash";
              pattern = "^:%s*!";
            };
            help = {
              icon = "󰘥 ";
              pattern = "^:%s*he?l?p?%s+";
            };
            input = { };
            lua = {
              icon = "";
              lang = "lua";
              pattern = "^:%s*lua%s+";
            };
            search_down = {
              icon = " ";
              kind = "search";
              lang = "regex";
              pattern = "^/";
            };
            search_up = {
              icon = " ";
              kind = "search";
              lang = "regex";
              pattern = "^%?";
            };
          };
        };
        lsp = {
          progress = { enabled = true; };
          override = {
            "cmp.entry.get_documentation" = true;
            "vim.lsp.util.convert_input_to_markdown_lines" = true;
            "vim.lsp.util.stylize_markdown" = true;
          };
        };
        health = { checker = false; };
        presets = {
          bottom_search = false;
          command_palette = true;
          long_message_to_split = true;
          inc_rename = true;
          lsp_doc_border = true;
        };
        popupmenu = { enabled = true; };
        # views = {
        #   cmdline_popup = {
        #     position = {
        #       row = "50%";
        #       col = "50%";
        #     };
        #     size = {
        #       width = 60;
        #       height = "auto";
        #     };
        #   };
        # };
      };
    };
  };
}
