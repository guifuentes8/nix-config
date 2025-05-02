{ pkgs, ... }: {

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
    discord
    flameshot
    fontpreview
    gimp
    harmony-music
    onlyoffice-bin
    pavucontrol
    ulauncher

  ];

}
