{ pkgs, lib, unstable, ... }:

{
  services.xserver = {
    enable = true;
    desktopManager.gnome = {
      enable = true;
    };
  };

  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
  services.gnome.gnome-browser-connector.enable = true;



  # default Gnome Programs
  environment.systemPackages = (with pkgs; [
    contrast
    endeavour
    foliate
    gaphor
    gnome-feeds
    marker
    pdfslicer
    rhythmbox
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
  ++ (with unstable.gnomeExtensions;
    [
      appindicator
      burn-my-windows
      color-picker
      desktop-cube
      docker
      dim-completed-calendar-events
      force-quit
      gnome-40-ui-improvements
      mpris-label
      order-gnome-shell-extensions
      overview-background
      tactile
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
      gnome-music
    ]);
}

