{ ... }: {
  imports = [

    # Global config (required)
    ./global

    ./features/dev
    ./features/neovim
    #./features/desktops/WM/hyprland.nix
    ./features/desktops/DE/gnome.nix
  ];

  #  wayland.windowManager.hyprland.settings.input = {
  #    kb_layout = "us";
  #    #    kb_layout = "br";
  #    #    kb_variant = "abnt2";
  #  };

  stylix.image = ./global/extras/mercury.jpg;

}
