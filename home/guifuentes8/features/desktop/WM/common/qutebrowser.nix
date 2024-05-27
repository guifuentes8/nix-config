{ config, lib, ... }: {
  programs.qutebrowser = {
    enable = true;
    aliases = { };
    quickmarks = {
      foo = "https://www.shortcutfoo.com/";
      ude = "https://www.udemy.com/pt/";
      ori = "https://www.origamid.com/conta/";
      rock = "https://app.rocketseat.com.br/";
      alu = "https://cursos.alura.com.br/onboarding/content";
      imp = "https://app.impulso.team/";
    };
    searchEngines = {
      # Nix search
      DEFAULT = "https://google.com.br/search?q={}";
      hm = "https://home-manager-options.extranix.com/?query={}&release=master";
      ns =
        "https://search.nixos.org/packages?channel=23.11&from=0&size=50&sort=relevance&type=packages&query={}";
      nsu =
        "https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query={}";
      nw = "https://nixos.wiki/index.php?search={}";
      # Other searchs
      aw = "https://wiki.archlinux.org/?search={}";
      yt = "https://www.youtube.com/results?search_query={}";
      gh = "https://github.com/search?q={}&type=repositories";
    };
    settings = {
      auto_save.session = false;
      colors = {
        tabs = {
          even.bg = lib.mkForce "#${config.lib.stylix.colors.base00}";
          selected.even.bg = lib.mkForce "#${config.lib.stylix.colors.base02}";
          selected.odd.bg = lib.mkForce "#${config.lib.stylix.colors.base02}";

        };
        webpage = {
          darkmode = {
            enabled = false;
            policy.images = "never";
          };
          preferred_color_scheme = "dark";
        };
      };
      url = { start_pages = "https://www.google.com.br"; };
      content = {
        notifications.enabled = false;
        javascript = {
          enabled = true;
          clipboard = "access";
        };
      };
      tabs = { position = "left"; };
    };
    extraConfig = ''
      c.tabs.padding = {'top': 4, 'bottom': 4, 'right': 2, 'left': 2}
    '';
  };
}
