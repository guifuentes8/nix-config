{ unstable, ... }:

{
  imports = [ ./dunst.nix ./mpv.nix ./qutebrowser.nix ./rofi ./xdg.nix ];

  services = {
    kdeconnect = {
      enable = true;
      indicator = true;
    };

    nextcloud-client = {
      enable = true;
      startInBackground = false;
    };
  };

  # Common programs Windows Managers
  programs = { zathura.enable = true; };
  home.packages = [ unstable.beeper ];
}
