{ pkgs, ... }: {

  programs.gpg = {
    enable = true;
    package = pkgs.gnupg;
  };

  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "gnome3";
  };

  home.packages = with pkgs; [
    git-crypt
  ];
}
