{ pkgs, ... }: {

  programs.gpg = {
    enable = true;
    package = pkgs.gnupg;
  };

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 60480000;
    maxCacheTtl = 60480000;
    extraConfig = ''
    
    '';

  };

}
