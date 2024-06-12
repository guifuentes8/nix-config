{ pkgs, ... }: {

  programs = { obs-studio.enable = true; };
  home.packages = with pkgs; [

    # programs
    beeper
    discord
    gimp
    onlyoffice-bin
    zoom-us

    # programs cli
    appimage-run
    ventoy-bin

    # dependencies
    ffmpeg
    pciutils
    pulseaudio
    unrar
    unzip
    chafa
    imagemagick
    ffmpegthumbnailer
    poppler_utils
    xdotool
    xorg.xprop

  ];
  services = {
    caffeine.enable = true;
    kdeconnect = {
      enable = true;
      indicator = true;
    };
    nextcloud-client = {
      enable = true;
      startInBackground = true;
    };
  };
}
