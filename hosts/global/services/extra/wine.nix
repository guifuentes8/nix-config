{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # ...

    # support both 32- and 64-bit applications
    wineWowPackages.stable
    winetricks

    # native wayland support (unstable)
    wineWowPackages.waylandFull

  ];

  hardware.opengl.driSupport32Bit = true;

}
