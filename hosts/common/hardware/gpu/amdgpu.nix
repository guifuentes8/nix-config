{ pkgs, config, ... }:

{
  boot.initrd.kernelModules = [ "amdgpu" ];
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [ mesa.drivers ];
    };
  };

  environment.variables.AMD_VULKAN_ICD = "RADV";

}
