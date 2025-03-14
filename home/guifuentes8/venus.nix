{ ... }: {
  imports = [

    # Global config (required)
    ../guifuentes8

    ../modules/features/dev
    ../modules/features/neovim
    ../modules/features/desktops/WM/hyprland.nix
    ../modules/features/desktops/DE/kde.nix

    ../modules/common/programs.nix
    ../modules/common/systemd.nix
    ../modules/common/services.nix
    ../modules/common/stylix.nix
    ../modules/common/sops.nix

  ];

  #  wayland.windowManager.hyprland.settings.input = {
  #    kb_layout = "br";
  #    kb_variant = "abnt2";
  #  };

  wayland.windowManager.hyprland.settings.input = {
    kb_layout = "us";
    #   kb_variant = "";
  };

  stylix.image = ../modules/common/extras/venus.jpg;

}
