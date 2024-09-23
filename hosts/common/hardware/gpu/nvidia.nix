{ pkgs, config, ... }:

{

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware = {
    graphics.enable = true;
    nvidia = {
      nvidiaSettings = true;
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      package = config.boot.kernelPackages.nvidiaPackages.production;

      prime = {
        sync.enable = true;
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:01:0:0";
      };
    };
  };

  boot = {
    extraModulePackages =
      [ config.boot.kernelPackages.nvidia_x11 ]; # Extra modules in kernel
  };

}
