{ ... }: {
  imports = [

    # Global config (required)
    ./users/gui8.nix
    ./modules/features/interfaces/DE/xfce.nix

  ];

  programs.zsh.initExtraFirst = "pokeget eevee";

}
