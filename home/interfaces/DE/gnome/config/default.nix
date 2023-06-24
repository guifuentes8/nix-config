{ pkgs, inputs, lib, ... }:
let addons = inputs.firefox-addons.packages.${pkgs.system};
in
{

  programs.firefox.profiles."guifuentes8".extensions = with addons; [
    gnome-shell-integration
  ];

  nixpkgs.config.allowUnfree = true;
  
 

  gtk = {
    enable = true;
    # font = {
    #   name = "JetBrainsMonoNL Nerd Font";
    #   size = 13;
    # };
    # cursorTheme = {
    #   name = "Bibata-Modern-Ice";
    #   package = pkgs.bibata-cursors;
    #   size = 24;
    # };
    # iconTheme = {
    #   name = "Adwaita";
    #   package = pkgs.colloid-icon-theme;
    # };
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
  };
}
