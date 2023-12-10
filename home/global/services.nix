{ lib, ... }:

{
  services = {
    kdeconnect = {
      enable = true;
      indicator = true;
    };

    gpg-agent = {
      enable = true;
      defaultCacheTtl = 60480000;
      maxCacheTtl = 60480000;
      extraConfig = '''';
      pinentryFlavor = "gnome3";
    };
  };

}
