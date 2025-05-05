{ pkgs, lib, ... }: {
  home.packages = with pkgs;
    lib.mkIf (pkgs.stdenv.hostPlatform.isLinux) [
      appimage-run
      ventoy-bin
      ffmpeg
      pciutils
      glxinfo
      pulseaudio
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
