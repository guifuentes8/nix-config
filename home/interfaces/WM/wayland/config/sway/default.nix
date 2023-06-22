{ inputs, outputs, lib, config, pkgs, ... }: {

  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.sway;
    extraConfig =
      (import ./config.nix {
        inherit (config);
      });
  };
}
