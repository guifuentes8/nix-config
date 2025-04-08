{ ... }: {
  imports = [

    # Global config (required)
    ../guifuentes8

    ../modules/features/dev
    ../modules/features/neovim
    ../modules/features/desktops/DE/xfce.nix

    ../modules/common/programs.nix
    ../modules/common/systemd.nix
    ../modules/common/services.nix
    ../modules/common/stylix.nix
    ../modules/common/sops.nix

  ];

  stylix.image = ../modules/common/extras/mercury.jpg;

}
