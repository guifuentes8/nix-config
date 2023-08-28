{ pkgs, ... }:
let
  icon = ./davinci-resolve-icon.png;
in

{
  imports = [

    # Global config (required)
    ./global

    # # # CHOICE ONE # # #

    # Environment (DE)
    ./interfaces/DE/shared
    ./interfaces/DE/gnome
    #1 ./interfaces/DE/kde
    #2 ./interfaces/DE/gnome

    # Environment (WM)
    #3 ./interfaces/WM/shared (CHOICE IF USE DE + WM)
    ./interfaces/WM/shared
    ./interfaces/WM/xorg

    # Wayland or Xorg (if WM is selected)
    # ./interfaces/WM/wayland

    # # # CHOICE ONE # # #
  ];


  # # # WAYLAND ONLY # # #

  # home.sessionVariables = {
  #   #MOZ_ENABLE_WAYLAND = 1; wayland
  # };

  home.packages = with pkgs; [
    davinci-resolve
  ];
  home.file."davinci-resolve.desktop" = {
    enable = true;
    executable = true;
    text = ''
      [Desktop Entry]
        Name=DaVinci Resolve
        GenericName=DaVinci Resolve
        Exec=env __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia davinci-resolve %u
        Type=Application
        Terminal=false
        Icon=${icon}
        StartupNotify=true
        StartupWMClass=resolve
        MimeType=application/x-resolveproj;
    '';
    target = ".local/share/applications/davinci-resolve.desktop";
  };

  # programs = {
  #   firefox = {
  #     packages = pkgs.firefox-wayland;
  #   };
  # };

  # xdg = {
  #   portal = {
  #     enable = true;
  #     extraPortals = with pkgs; [
  #       xdg-desktop-portal-wlr
  #       xdg-desktop-portal-gtk
  #     ];
  #   };
  # };

  # # # WAYLAND ONLY # # #

}
