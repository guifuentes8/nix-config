{ pkgs, config, ... }:

{

  services.xserver = {
    videoDrivers = [ "nvidia" "nomodeset" ];
  };

  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
    nvidia = {
      nvidiaSettings = true;
      modesetting.enable = true;
      powerManagement.enable = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;

    };
  };

  boot = {
    extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ]; # Extra modules in kernel
  };

}
