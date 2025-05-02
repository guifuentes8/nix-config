{ pkgs, ... }: {
  home.packages = with pkgs; [

    ffmpeg
    pciutils
    nix-search-cli
    glxinfo
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
    appimage-run
    ventoy-bin

  ];

}
