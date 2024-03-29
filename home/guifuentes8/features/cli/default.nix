{ inputs, outputs, lib, config, pkgs, unstable, ... }: {
  imports = [
    ./bat.nix
    ./bottom.nix
    ./feh.nix
    ./gh.nix
    ./git.nix
    ./gpg.nix
    ./lsd.nix
    ./pass.nix
    ./ripgrep.nix
    ./ssh.nix
    ./starship.nix
    ./tmux.nix
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
    pastel # color cli
    slides # presentation slides
    speedtest-rs # Networking test
    tgpt # chatgpt
    tty-clock # clock
  ];
}
