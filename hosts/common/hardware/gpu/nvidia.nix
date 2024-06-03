{ pkgs, config, ... }:

{

  services.xserver.videoDrivers = [ "nvidia" ];

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
      powerManagement.finegrained = false;
      package = config.boot.kernelPackages.nvidiaPackages.production;

    };
  };

  boot = {
    extraModulePackages =
      [ config.boot.kernelPackages.nvidia_x11 ]; # Extra modules in kernel
  };

}
