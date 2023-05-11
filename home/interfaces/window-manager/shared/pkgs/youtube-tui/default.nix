{ pkgs, ... }:
{
  programs.yt-dlp = {
    enable = true;
  };
  home.packages = with pkgs; [
    youtube-tui
  ];
  # Esse arquivo não pode ser linkado simbolicamente, copiar o conteúdo e colocar no .config
  xdg.configFile."youtube-tui/main.yml".source = ./main.yml;
  xdg.configFile."youtube-tui/commands.yml".source = ./commands.yml;
}
