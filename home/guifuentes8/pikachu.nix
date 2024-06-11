{ nix-colors, lib, ... }: {
  imports = [

    # Global config (required)
    ./common

    ./features/cli
    ./features/dev
    ./features/music
    ./features/neovim
    ./features/desktop/WM/hyprland.nix

    # ./features/video/davinci-resolve

    nix-colors.homeManagerModules.default

    ./stylix.nix

  ];
  colorScheme = nix-colors.colorSchemes.catppuccin-mocha;

  programs.zsh.initExtraFirst = "cat ${./extras/pikachu.txt}";
  wayland.windowManager.hyprland.settings.input = {
    kb_layout = "br";
    kb_variant = "abnt2";
  };

}
