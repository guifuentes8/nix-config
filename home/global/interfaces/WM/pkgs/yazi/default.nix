{ pkgs, ... }:
{

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };

  home.packages = with pkgs; [
    ueberzugpp
    ffmpegthumbnailer
    poppler
    mupdf
    unar
    fd
    fzf-zsh
    zoxide
  ];

  xdg.configFile."yazi/keymap.toml".source = ./keymap.toml;
  xdg.configFile."yazi/theme.toml".source = ./theme.toml;
  xdg.configFile."yazi/yazi.toml".source = ./yazi.toml;
}
