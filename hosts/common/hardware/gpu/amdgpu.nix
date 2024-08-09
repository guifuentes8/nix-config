{ pkgs, config, ... }:

{
  boot.initrd.kernelModules = [ "amdgpu" ];
  #  hardware = {
  #    graphics = {
  #      enable = true;
  #      extraPackages = with pkgs; [ mesa.drivers ];
  #    };
  #  };

  environment.variables.AMD_VULKAN_ICD = "RADV";

}
