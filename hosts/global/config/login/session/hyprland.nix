{ pkgs, ... }:
{

  services.xserver = {
    displayManager.defaultSession = "none+Hyprland";
    displayManager.session = [
      {
        manage = "window";
        name = "Hyprland";
        start = ''exec Hyprland'';
      }
    ];
  };
}
