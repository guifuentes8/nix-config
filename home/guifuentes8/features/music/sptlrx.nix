{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    sptlrx
  ];
  xdg.configFile."sptlrx/config.yaml".source = (pkgs.formats.yaml { }).generate "config.yaml"
    {
      cookie = "sp_t=4b939b2c7e90faea2cf6059edac70506; _gcl_au=1.1.1562353812.1678393707; _scid=c11f27a5-e85f-4b53-97ce-7d4f5eab0aa6; sp_dc=AQC_oX7aL1kulg-KJBmfNEPdu0xTjTIITarlCXn7CpMzUWC5fHLVU6HJWEvI-BlnpkB3q2k_q2PcwTShFZVQceiSNSfjw1BmwN4EH5YB095OnA6XuNG76mnVmoAYm6R-G_LoarWDZSiYb5ogqwyPYZQzpY-sk5s; sp_key=27a6b41f-87a2-49e2-a1af-fb0fac7af66a; _gid=GA1.2.623756090.1678588229; _ga_LJDH9SQRHZ=GS1.1.1678665966.1.0.1678666013.0.0.0; sp_landing=https://open.spotify.com/?sp_cid=4b939b2c7e90faea2cf6059edac70506&device=desktop; OptanonConsent=isIABGlobal=false&datestamp=Mon+Mar+13+2023+00:53:00+GMT-0300+(Brasilia+Standard+Time)&version=6.26.0&hosts=&landingPath=NotLandingPage&groups=s00:1,f00:1,m00:1,t00:1,i00:1,f11:1&AwaitingReconsent=false; sss=1; _gat_UA-5784146-31=1; _ga=GA1.1.1691331524.1678393707; _ga_ZWG1NSHWD8=GS1.1.1678679580.3.0.1678679580.0.0.0";
      player = "spotify";
      timerInterval = 200;
      updateInterval = 1000;
      style = {

        hAlignment = "center";
        before = {
          background = "";
          foreground = "#${config.colorScheme.colors.base03}";
          bold = true;
          italic = false;
          undeline = false;
          strikethrough = false;
          blink = false;
          faint = false;
        };

        current = {
          background = "";
          foreground = "#${config.colorScheme.colors.base0D}";
          bold = true;
          italic = false;
          undeline = false;
          strikethrough = false;
          blink = false;
          faint = false;
        };

        after = {
          background = "";
          foreground = "#${config.colorScheme.colors.base0B}";
          bold = false;
          italic = false;
          undeline = false;
          strikethrough = false;
          blink = false;
          faint = true;
        };

      };
      pipe = {
        length = 0;
        overflow = "word";
        ignoreErrors = true;
      };
      mpd = {
        address = "127.0.0.1:6600";
        password = "";
      };
      mopidy = {
        address = "127.0.0.1:6680";
      };

    };
}
