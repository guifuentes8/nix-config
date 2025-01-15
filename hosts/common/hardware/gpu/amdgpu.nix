{ pkgs, config, ... }:

{
  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];
  hardware.opengl.extraPackages = with pkgs; [ rocmPackages.clr.icd ];
  hardware.graphics.enable32Bit = true; # For 32 bit applications
  environment.variables.AMD_VULKAN_ICD = "RADV";

}
