{ ... }: {
  imports = [

    # Global config (required)
    ./common

    ./features/cli
    ./features/dev
    ./features/music
    ./features/neovim
    ./features/desktop/WM/hyprland.nix
    # ./features/video/davinci-resolve

    ./stylix.nix

  ];

  programs.zsh.initExtraFirst = "cat ${./extras/pikachu.txt}";

  # Keyboard
  wayland.windowManager.hyprland.settings.input = {
    kb_layout = "br";
    kb_variant = "abnt2";
  };

}
