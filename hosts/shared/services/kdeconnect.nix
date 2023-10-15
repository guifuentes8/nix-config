{ pkgs, ... }: {
  programs.kdeconnect.enable = true;
  # programs.kdeconnect.package = pkgs.gnomeExtensions.gsconnect;
}
