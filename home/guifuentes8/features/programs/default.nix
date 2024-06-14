{ pkgs, ... }: {

  imports = [ ./dependencies.nix ];
  programs = { obs-studio.enable = true; };
  home.packages = with pkgs; [

    # programs
    beeper
    discord
    gimp
    onlyoffice-bin
    pavucontrol
    spotube
    zoom-us

    # programs cli
    appimage-run
    ventoy-bin
  ];

}
