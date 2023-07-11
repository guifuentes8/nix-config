{ pkgs, config, ... }:

{
  boot.initrd.kernelModules = [ "amdgpu" ];

  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];
  };

  hardware = {
    opengl = {
      package = pkgs.mesa.drivers;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        rocm-opencl-icd
        rocm-opencl-runtime
        intel-compute-runtime
        amdvlk
    ];
    };
  };

  environment.variables.AMD_VULKAN_ICD = "RADV";

}
