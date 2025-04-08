{ pkgs, ... }: {
  services.xserver.enable = true;
  services.xserver.desktopManager.xfce.enable = true;
  programs.thunar.enable = true;
  services.xserver.desktopManager.xfce.enableScreensaver = true;
  environment.systemPackages = (with pkgs;
    [

    ]);

  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  services.displayManager.defaultSession = "xfce";
  services.displayManager.autoLogin = {
    enable = true;
    user = "guifuentes8";
  };

}
