{ unstable, ... }:
{
  # programs.joshuto = { # 23.11 only
  #   enable = true;
  # };

  home.packages = with unstable;[
    yazi
    ueberzugpp
    ffmpegthumbnailer
    poppler
    mupdf
    unar
    fd
    ripgrep
    fzf-zsh
    zoxide

  ];


  xdg.configFile."yazi/keymap.toml".source = ./keymap.toml;
  xdg.configFile."yazi/theme.toml".source = ./theme.toml;
  xdg.configFile."yazi/yazi.toml".source = ./yazi.toml;
}
