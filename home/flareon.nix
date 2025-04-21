{ ... }: {
  imports = [

    # Global config (required)
    ./default.nix
    ./modules/features/interfaces/WM/hyprland.nix

  ];

  wayland.windowManager.hyprland.settings.input = {
    kb_layout = "br";
    kb_variant = "abnt2";
  };

  stylix.image = ./modules/common/extras/eevee.jpeg;

}
