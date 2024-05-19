{ pkgs, ... }: {
  imports = [
    ./kitty.nix
    ./picom.nix
    ./polybar.nix
    ./i3lock.nix
    ./sxhkd.nix
    ../common
  ];

  services = { flameshot.enable = true; };

  home.packages = with pkgs; [ lxappearance xclip xcolor ];
}
