{ config, lib, pkgs, inputs, outputs, nix-colors, unstable, ... }:

{
  imports = [

    ../global
    ../global/services/common
    ../global/users/guifuentes8.nix
    ../global/hardware/gpu/amdgpu.nix
    inputs.nix-wsl.nixosModules.wsl
  ];
  wsl.enable = true;
  wsl.defaultUser = "guifuentes8";
  wsl.startMenuLaunchers = true;

  home-manager.users.guifuentes8 = import ../../home/guifuentes8/windows.nix;

  environment.sessionVariables = {
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
  };
}
