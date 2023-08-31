{ pkgs, config, ... }:

{
  services.xserver = {
    enable = true;
    videoDrivers = [ "intel" ];
  };

  hardware = {
    opengl = {
      package = pkgs.mesa.drivers;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver # LIBVA_DRIVER_NAME=iHD
        vaapiIntel # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
        vaapiVdpau
        libvdpau-va-gl
      ];
    };
  };

}
