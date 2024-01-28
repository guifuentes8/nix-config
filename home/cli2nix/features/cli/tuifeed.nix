{ pkgs, ... }:
{
  home.packages = with pkgs; [
    tuifeed
  ];
  xdg.configFile."tuifeed/config.toml".source = (pkgs.formats.toml { }).generate "config.toml"
  {
    sources = {
      Diolinux = "https://plus.diolinux.com.br/c/diolinux-feed/15.rss";
      Diolinux_Noticias = "https://plus.diolinux.com.br/c/noticias-tecnologia/20.rss";
    };
  };
}
