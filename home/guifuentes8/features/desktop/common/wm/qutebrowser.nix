{ config, ... }: {
  # base00 = "#${config.colorScheme.colors.base00}"
  # base01 = "#${config.colorScheme.colors.base01}"
  # base02 = "#${config.colorScheme.colors.base02}"
  # base03 = "#${config.colorScheme.colors.base03}"
  # base04 = "#${config.colorScheme.colors.base04}"
  # base05 = "#${config.colorScheme.colors.base05}"
  # base06 = "#${config.colorScheme.colors.base06}"
  # base07 = "#${config.colorScheme.colors.base07}"
  # base08 = "#${config.colorScheme.colors.base08}"
  # base09 = "#${config.colorScheme.colors.base09}"
  # base0A = "#${config.colorScheme.colors.base0A}"
  # base0B = "#${config.colorScheme.colors.base0B}"
  # base0C = "#${config.colorScheme.colors.base0C}"
  # base0D = "#${config.colorScheme.colors.base0D}"
  # base0E = "#${config.colorScheme.colors.base0E}"
  # base0F = "#${config.colorScheme.colors.base0F}"

  programs.qutebrowser = {
    enable = true;
    aliases = { };
    settings = { };
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
      hm = "https://mipmip.github.io/home-manager-option-search/?query={}";
      ns =
        "https://search.nixos.org/packages?channel=23.11&from=0&size=50&sort=relevance&type=packages&query={}";
      nsu =
        "https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query={}";
      nw = "https://nixos.wiki/index.php?search={}";

      # Other searchs
      aw = "https://wiki.archlinux.org/?search={}";
      g = "https://www.google.com/search?hl=en&q={}";
    };
    extraConfig = ''
      import os
      from urllib.request import urlopen

      # load your autoconfig, use this, if the rest of your config is empty!
      config.load_autoconfig()

      if not os.path.exists(config.configdir / "theme.py"):
          theme = "https://raw.githubusercontent.com/catppuccin/qutebrowser/main/setup.py"
          with urlopen(theme) as themehtml:
              with open(config.configdir / "theme.py", "a") as file:
                  file.writelines(themehtml.read().decode("utf-8"))

      if os.path.exists(config.configdir / "theme.py"):
          import theme
          theme.setup(c, 'frappe', True)
    '';

  };
}
