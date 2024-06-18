{ ... }: {
  imports = [
    # Global config (required)
    ./global

    # Others configs
    ./features/dev
    ./features/neovim
    ./features/desktops/DE/kde.nix

  ];

  programs.zsh.initExtraFirst = "cat ${./global/extras/charizard.txt}";

}
