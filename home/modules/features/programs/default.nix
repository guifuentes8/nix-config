{ pkgs, ... }: {

  imports = [ ./dependencies.nix ];
  programs = {
    obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        obs-backgroundremoval
        obs-pipewire-audio-capture
        obs-shaderfilter
        wlrobs
      ];
    };
  };
  home.packages = with pkgs.unstable; [

    # programs
    bitwarden
    discord
    flameshot
    fontpreview
    gimp
    gnome-epub-thumbnailer
    harmony-music
    onlyoffice-bin
    pavucontrol
    ytdownloader
    zoom-us

    # programs cli
    appimage-run
    ventoy-bin
  ];

}
