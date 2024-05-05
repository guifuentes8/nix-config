{ pkgs, config, ... }: {
  imports = [ ./mail.nix ./calendar.nix ./translator.nix ];
}
