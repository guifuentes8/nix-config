{ pkgs, config, ... }: {
  imports = [
    ./mail.nix
    ./gcalcli.nix
    ./translate-shell.nix
    ./taskwarrior.nix
    ./watson.nix
  ];
}
