{ pkgs, ... }: {
  imports = [ ];

  programs = { ssh = { enable = true; }; };
}
