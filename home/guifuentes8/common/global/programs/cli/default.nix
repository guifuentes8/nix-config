{ pkgs, ... }: {
  imports = [
    ./gh.nix
    ./git.nix
    ./kitty.nix
    ./ncspot.nix
  ];
  home.packages = with pkgs; [
    bottom
    cava
    cmatrix
    feh
    fortune
    gcalcli
    himalaya
    neofetch
    pokete
    pokemonsay
    ranger
    sptlrx
    todo
    tuifeed
  ];
}
