{ ... }: {
  imports = [

    # Global config (required)
    ./global

    ./features/dev
    ./features/neovim
    ./features/desktops/WM/hyprland.nix

  ];

  # Keyboard
  wayland.windowManager.hyprland.settings.input = {
    kb_layout = "br";
    kb_variant = "abnt2";
  };

  stylix.image = ./global/extras/venus.png;

}
