{ pkgs, config, ... }: {
  imports = [
    ./mail.nix
    ./gcalcli.nix
    ./translate-shell.nix
    ./pass.nix
    ./taskwarrior.nix
    ./watson.nix
  ];
}
