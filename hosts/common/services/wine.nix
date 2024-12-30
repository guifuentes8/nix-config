{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # wineWowPackages.stable
    winetricks
    wine
    # wineWowPackages.waylandFull
  ];
  hardware.graphics.enable32Bit = true;

}
