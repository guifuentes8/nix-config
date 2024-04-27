{ pkgs, ... }: {
  imports = [ ];

  programs = {

    gpg = {
      enable = true;
      # mutableTrust = true;
      # mutableKeys = true;
      #      settings = { default-key = "guifuentes8@gmail.com"; };
      #   publicKeys = [
      #  {
      #        source = ./secret.gpg;
      #        trust = "ultimate";
      #   }
      #  ];
    };

  };
  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 60480000;
    maxCacheTtl = 60480000;
    extraConfig =
      "pinentry-program ${pkgs.pinentry-curses}/bin/pinentry-curses";
    pinentryFlavor = "curses";
  };

}
