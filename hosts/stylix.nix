{ pkgs, unstable, ... }:
let cursor = "catppuccin-mocha-dark-cursors";
in {

  stylix = {
    enable = true;
    autoEnable = true;
    polarity = "dark";
    base16Scheme =
      "${unstable.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    cursor = {
      name = cursor;
      package = pkgs.catppuccin-cursors.mochaDark;
      size = 32;
    };
    fonts = {
      monospace = {
        name = "JetBrainsMonoNL Nerd Font";
        package = (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; });
      };
    };
    opacity = {
      applications = 0.8;
      terminal = 0.85;
      desktop = 0.8;
    };
    override = { };
    targets = { nixvim.enable = false; };
  };

}
