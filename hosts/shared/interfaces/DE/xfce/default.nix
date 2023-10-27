{ pkgs, ... }:
{
  services.xserver.desktopManager.xfce.enable = true;
  programs.thunar.enable = true;
  services.xserver.desktopManager.xfce.enableScreensaver = true;
  environment.systemPackages = (with pkgs; [

  ]);

  # environment.xfce.excludePackages

}
