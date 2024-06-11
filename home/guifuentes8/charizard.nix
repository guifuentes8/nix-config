{ nix-colors, ... }: {
  imports = [
    nix-colors.homeManagerModules.default

    # Global config (required)
    ./common

    # Others configs
    ./features/dev
    ./features/neovim	
    ./features/desktop/DE/kde.nix
    ./features/desktop/WM/hyprland.nix

    ./features/music

    # ./features/video/davinci-resolve

    ./stylix.nix
  ];

  colorScheme = nix-colors.colorSchemes.catppuccin-mocha;

  programs.zsh.initExtraFirst = ''cat ${./charizard.txt}'';

}
