{ pkgs, ... }: {
  imports = [
    ./gh.nix
    ./git.nix
    ./kitty.nix
    ./ncspot.nix
    ./zsh.nix
  ];
  home.packages = with pkgs; [
    bottom
    cava
    cmatrix
    feh
    fortune
    gcalcli
    himalaya
    pfetch
    pokete
    pokemonsay
    ranger
    sptlrx
    todo
    tuifeed
  ];
}
