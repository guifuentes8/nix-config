{ ... }: {
  imports = [

    # Global config (required)
    ../guifuentes8

    ../modules/features/dev
    ../modules/features/neovim
    ../modules/features/cli
    ../modules/common/programs.nix
    ../modules/common/systemd.nix
    ../modules/common/services.nix
    ../modules/common/sops.nix

  ];

}

