{ pkgs, ... }: {
  imports = [
    ./gh.nix
    ./git.nix
    ./gpg.nix
    ./himalaya.nix
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
    pfetch
    pokete
    pokemonsay
    ranger
    sptlrx
    todo
    tuifeed
  ];
}
