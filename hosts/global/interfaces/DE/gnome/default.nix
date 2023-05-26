{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
    desktopManager.gnome = {
      enable = true;
    };
  };

  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];


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

