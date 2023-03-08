{ pkgs, config, ... }:

{

 services.xserver = {
    videoDrivers = [ "nvidia" "nomodeset" ];
    deviceSection = ''
      Option "DRI" "2"
      Option "TearFree" "true"
    '';
    screenSection = ''
      Option         "metamodes" "nvidia-auto-select +0+0 {ForceFullCompositionPipeline=On}"
      Option         "AllowIndirectGLXProtocol" "off"
      Option         "TripleBuffer" "on"
    '';
  };

  hardware = {
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      nvidiaPersistenced = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };

  boot = {
    extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ]; # Extra modules in kernel
  };

}
