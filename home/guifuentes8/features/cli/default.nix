{ inputs, outputs, lib, config, pkgs, unstable, ... }: {
  imports = [
    ./bat.nix
    ./bottom.nix
    ./gh.nix
    ./git.nix
    ./gpg.nix
    ./pass.nix
    ./ssh.nix
    ./tmux.nix
    ./tuifeed.nix
    ./yazi.nix
    ./zsh.nix
  ];

  programs = {
    feh.enable = true;
    jq.enable = true;
    lsd.enable = true;
    ripgrep.enable = true;
    rtorrent.enable = true;
    yt-dlp.enable = true;
  };

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
