{ pkgs, ... }: {
  imports = [ ];

  programs = { ssh = { enable = true; }; };
  home.file = {
    ".ssh/id_ed25519.pub" = {
      enable = true;
      source = ./id_ed25519.pub;
    };
  };
  home.file = {
    ".ssh/id_ed25519" = {
      enable = true;
      source = ./id_ed25519;
    };
  };

}
