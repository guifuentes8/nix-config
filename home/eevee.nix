{ ... }: {
  imports = [

    # Global config (required)
    ./users/gui8.nix
    ./modules/features/interfaces/DE/xfce.nix

  ];

  stylix.image = ../modules/common/extras/eevee.jpeg;

  programs.zsh.initExtraFirst = "pokeget eevee";

}
