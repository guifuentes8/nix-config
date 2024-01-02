{ inputs, pkgs, ... }: {
<<<<<<< Updated upstream

  imports = [ inputs.hyprland.nixosModules.default ./shared ];
  programs = { hyprland.enable = true; };
=======
  imports = [ inputs.hyprland.nixosModules.default ];
  programs = {
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    };
  };
>>>>>>> Stashed changes

  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys =
      [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

  environment.systemPackages = (with pkgs; [ xdg-utils ]);

  xdg.portal = {
    enable = true;
    config.common.default = "*";
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };

}
