{ pkgs, unstable, lib, outputs, ... }: {
  imports = [ ./gtk.nix ./cursor.nix ./icon.nix ./qt.nix ];
}

