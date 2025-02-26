{   pkgs, ... }: {

  imports = [ ./dependencies.nix ];
  programs = {
    obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
        obs-shaderfilter
      ];
    };
  };
  home.packages = with pkgs.unstable; [

    # programs
    discord
    gimp
    onlyoffice-bin
    pavucontrol
    spotube
    youtube-music
    zoom-us

    # programs cli
    appimage-run
    ventoy-bin
  ];

}
