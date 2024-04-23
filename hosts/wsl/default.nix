{ config, lib, pkgs, inputs, outputs, nix-colors, unstable, configOptions, ...
}:

{
  imports = [

    ../global
    ../global/users/guifuentes8.nix
    ../global/hardware/gpu/amdgpu.nix
    ../global/services/common

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
    systemPackages = [ pkgs.nextcloud-client ];
    sessionVariables = {
      ELECTRON_OZONE_PLATFORM_HINT = "wayland";
      NIXOS_OZONE_WL = "1";
      MOZ_ENABLE_WAYLAND = "1";
      WGPU_BACKEND = "gl";
      BROWSER = "org.qutebrowser.qutebrowser.desktop";
      WSLENV = "ANDROID_HOME/p";
      ANDROID_HOME =
        "/mnt/c/Users/${configOptions.windowsUser}/Local Settings/Android/Sdk";
    };

  };

  environment.etc."nextcloud-admin-pass".text = "";
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud28;
    hostName = "https://kim.nl.tab.digital/";
    database.createLocally = true;
    config.adminpassFile = "/etc/nextcloud-admin-pass";
    config.adminuser = "guifuentes8@gmail.com";
    configureRedis = true;
    extraApps = {
      inherit (pkgs.nextcloud28Packages.apps) tasks mail calendar contacts;
    };
    extraAppsEnable = true;
  };

}
