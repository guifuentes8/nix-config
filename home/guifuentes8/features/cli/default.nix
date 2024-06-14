{ pkgs, config, ... }: {

  imports = [ ./cava.nix ];
  programs = {
    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [ batdiff batman batgrep batwatch ];
    };
    bottom = {
      enable = true;
      settings = { };
    };
    feh.enable = true;
    jq.enable = true;
    lsd.enable = true;
    ncmpcpp = {
      package = pkgs.ncmpcpp.override { visualizerSupport = true; };
      enable = true;
      mpdMusicDir = "${config.home.homeDirectory}/Nextcloud/Music";
    };
    rtorrent.enable = true;
    translate-shell.enable = true;
    yt-dlp.enable = true;
    yazi = {
      enable = true;
      package = pkgs.yazi;
      enableZshIntegration = true;
      keymap = { };
      settings = { };
      theme = { };
    };
  };

  home.packages = with pkgs; [
    cmatrix # matrix
    cava # audio visualizer
    dipc # palette wallpaper converter
    devour # hide terminal
    epr # E-pub reader
    girouette # Weather
    pastel # color cli
    speedtest-rs # Networking test
    tgpt # chatgpt
    tty-clock # clock
  ];

}
