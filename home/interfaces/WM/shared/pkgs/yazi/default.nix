{ unstable, ... }:
{
  # programs.yazi = { # 23.11 only
  #   enable = true;
  #   enableZshIntegration = true;
  # };

  home.packages = with unstable;[
    yazi
    ueberzug
    ffmpegthumbnailer
    poppler_utils
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
