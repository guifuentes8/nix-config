{ pkgs, ... }: {
  home.packages = with pkgs; [

    ffmpeg
    pciutils
    nix-search-cli
    #pulseaudio
    unrar
    unzip
    chafa
    lshw
    imagemagick
    ffmpegthumbnailer
    poppler_utils
    xdotool
    playerctl
    xorg.xprop
    cacert
  ];

}
