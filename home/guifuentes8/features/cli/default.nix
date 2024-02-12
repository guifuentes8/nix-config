{ inputs, outputs, lib, config, pkgs, unstable, ... }: {
  imports = [
    ./alacritty.nix
    ./bat.nix
    ./bottom.nix
    ./cava.nix
    ./feh.nix
    ./gh.nix
    ./git.nix
    ./gcalcli.nix
    ./gpg.nix
    ./kitty.nix
    ./lsd.nix
    ./ncmpcpp.nix
    ./ncspot.nix
    ./ripgrep.nix
    ./spotify-player.nix
    ./sptlrx.nix
    ./ssh.nix
    ./starship.nix
    ./translate-shell.nix
    ./tuifeed.nix
    ./yazi.nix
    ./ytdlp.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [

    cmatrix # matrix
    devour # hide terminal
    epr # E-pub reader
    girouette # Weather
    nb # notebook
    pastel # color cli
    slides # presentation slides
    speedtest-rs # Networking test
    tgpt # chatgpt
    tty-clock # clock
  ];
}
