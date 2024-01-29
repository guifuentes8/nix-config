{ pkgs, config, ... }: {
  imports = [ ./mail.nix ./pass.nix ./taskwarrior.nix ./watson.nix ];
}
