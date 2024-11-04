{ pkgs, config, lib, ... }:

{
  services.xserver = {
    enable = true;
    videoDrivers = [ "intel" ];
  };

  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };

  # only in 24.11
  # hardware.graphics = {
  hardware.opengl = {
  enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      intel-vaapi-driver
      libvdpau-va-gl
    ];
  };

  boot.initrd.kernelModules = [ "i915" ];

# only in 24.11
#  environment.variables = {
#    VDPAU_DRIVER =
#      lib.mkIf config.hardware.graphics.enable (lib.mkDefault "va_gl");
#  };

  boot.kernelParams = [ "acpi_backlight=video" "coretemp" "kvm-intel" ];
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="intel_backlight", GROUP="video", MODE="0664"
  '';

}
