{ ... }: {
  imports = [

    # Global config (required)
    ./global

    ./features/dev
    ./features/neovim
    ./features/desktops/WM/hyprland.nix

  ];

  programs.zsh.initExtraFirst = "cat ${./global/extras/pikachu.txt}";

  # Keyboard
  wayland.windowManager.hyprland.settings.input = {
    kb_layout = "br";
    kb_variant = "abnt2";
  };

}
