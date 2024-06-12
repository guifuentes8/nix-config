{ pkgs, ... }: {

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
