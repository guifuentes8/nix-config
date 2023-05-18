{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    # Xorg packages
    ../../pkgs

    # Shared window manager folder (pkgs and xdg)
    ../../../shared
    inputs.hyprland.homeManagerModules.default
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.default;
    extraConfig =
      (import ./config.nix {
        inherit (config);
      });
  };
}
