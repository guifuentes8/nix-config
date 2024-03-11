{ config, lib, pkgs, inputs, outputs, nix-colors, unstable, windowsUser, ... }:

{
  imports = [

    ../global
    ../global/users/guifuentes8.nix
    ../global/hardware/gpu/amdgpu.nix

    inputs.nix-wsl.nixosModules.wsl
  ];
  wsl = {
    enable = true;
    wslConf.automount.root = "/mnt";
    wslConf.interop.appendWindowsPath = false;
    wslConf.network.generateHosts = false;
    nativeSystemd = true;
    useWindowsDriver = true;

    defaultUser = "guifuentes8";
    startMenuLaunchers = true;

    # Enable integration with Docker Desktop (needs to be installed)
    docker-desktop.enable = false;
  };

  home-manager.users.guifuentes8 = import ../../home/guifuentes8/windows.nix;

  environment = {
    systemPackages = [ pkgs.firefox pkgs.wget ];
    sessionVariables = {
      ELECTRON_OZONE_PLATFORM_HINT = "wayland";
      NIXOS_OZONE_WL = "1";
      MOZ_ENABLE_WAYLAND = "1";
      WGPU_BACKEND = "gl";
      BROWSER = "firefox";
      WSLENV = "ANDROID_HOME/p";
      ANDROID_HOME = "/mnt/c/Users/${windowsUser}/Local Settings/Android/Sdk";
    };

  };
}
