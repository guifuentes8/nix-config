{ pkgs, ... }: {
  home.packages = with pkgs; [

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
    playerctl
    xorg.xprop

  ];

}
