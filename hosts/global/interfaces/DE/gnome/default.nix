{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
    desktopManager.gnome = {
      enable = true;
    };
  };

  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
  services.gnome.gnome-browser-connector.enable = true;

  programs.kdeconnect.enable = true;
  programs.kdeconnect.package = pkgs.gnomeExtensions.gsconnect;

  # default Gnome Programs
  environment.systemPackages = (with pkgs; [
    contrast
    endeavour
    foliate
    gaphor
    gnome-feeds
    marker
    pdfslicer

  ])

  # Gnome exclusive programs and icons
  ++ (with pkgs.gnome;
    [
      adwaita-icon-theme
      gnome-themes-extra
      gnome-tweaks
      gnome-boxes
    ])

  # Gnome extensions 
  ++ (with pkgs.gnomeExtensions;
    [
      appindicator
      burn-my-windows
      color-picker
      clipboard-indicator-2
      desktop-cube
      docker
      downloads-indicator
      dim-completed-calendar-events
      force-quit
      gnome-40-ui-improvements
      mpris-label
      order-gnome-shell-extensions
      overview-background
      tactile
      trash-indicator
      virtualbox-applet-2
      wallpaper-switcher
      wayland-or-x11
      weather-oclock
    ]);

  # Remove default gnome packages
  environment.gnome.excludePackages =
    (with pkgs.gnome;
    [
      atomix
      epiphany
      hitori
      iagno
      tali
      seahorse
    ]);
}

