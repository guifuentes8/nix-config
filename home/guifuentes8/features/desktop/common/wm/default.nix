{ pkgs, ... }: {
  programs = { zathura.enable = true; };
  home.packages = with pkgs; [ pavucontrol playerctl ];
  services = { playerctld.enable = true; };

  imports = [ ./rofi ./alacritty.nix ./dunst.nix ./kitty.nix ./xdg.nix ];

}
