{ pkgs, config, ... }:

{
  services.xserver = {
    services.xserver.enable = true;
    videoDrivers = [ "amdgpu" ];
  };

  hardware = {
    opengl.driSupport = true;
    opengl.driSupport32Bit = true;
    opengl.extraPackages = with pkgs; [
      rocm-opencl-icd
      rocm-opencl-runtime
      amdvlk
      driversi686Linux.amdvlk
    ];
  };

  boot.initrd.kernelModules = [ "amdgpu" ];

}
