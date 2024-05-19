{ pkgs, ... }:
{
 services.xserver.enable = true; 
 services.xserver.desktopManager.xfce.enable = true;
  programs.thunar.enable = true;
  services.xserver.desktopManager.xfce.enableScreensaver = true;
  environment.systemPackages = (with pkgs; [

  ]);

services.xserver.displayManager.defaultSession = "xfce";
services.xserver.displayManager.autoLogin = {
	enable = true;
	user = "guifuentes8";
};
  # environment.xfce.excludePackages

}
