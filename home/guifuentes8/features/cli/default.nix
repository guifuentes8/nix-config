{ pkgs, config, ... }: {

  imports = [ ./cava.nix ];
  programs = {
    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [ batdiff batman batgrep batwatch ];
    };
    bottom = {
      enable = true;
      settings = {
        flags = {
          temperature_type = "c";
          rate = 500;
        };
      };
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
    ytermusic # music from youtube
  ];

  xdg.configFile."ytermusic/headers.txt".text = ''
    Cookie: HSID=AQ2nsjiTbN5KepeU2; SSID=AFs_Vm9hOLGE-I0mV; APISID=z1tl8IYabbTL8FDM/Ate3JQjYXLIiymuDC; SAPISID=uAPiVpNBHB93pTBc/A9SEF2Tqxp8WiIq25; __Secure-1PAPISID=uAPiVpNBHB93pTBc/A9SEF2Tqxp8WiIq25; __Secure-3PAPISID=uAPiVpNBHB93pTBc/A9SEF2Tqxp8WiIq25; LOGIN_INFO=AFmmF2swRQIgUtBorR0cQuBhHgDyNxH91hUxOvZQDtJ3eK4j9pvA5AYCIQDQ02wdYguQ2Ms_HND7OoD9qjrrJJTkEdW41ayD8uYSHQ:QUQ3MjNmekZEaEllMmdZUWVBNkVWUmtFYnBIYV9WVUdkLWhEb2ZkbWRHQm1BQms2MnhtUkZvODNLYnh0d1QzbDNZTUZrWUtVR1ktbGpBRENtNDBSeHFxZjE0a3JKa0lNQXBlbkw4V1Bqek8tTkRmR0l1YjR4LWtkVnNIa21hTWdOdXhTZUN6SHB4TmYxQ0daTUdJYjR6cnExeGJqMnk2aHJB; VISITOR_INFO1_LIVE=UNM6Wj_zeK8; VISITOR_PRIVACY_METADATA=CgJCUhIEGgAgNA%3D%3D; SID=g.a000qwh8HAD7kyB18AURkIGp68pRzrNi4tK9vBQNSA952gWSzsUVtdWip0mmWabFuJ1Hx9I_8wACgYKAXESARASFQHGX2MiOvB6B2LwL1xbyVMunBxAZRoVAUF8yKoPpRc3xmNustny6ioKMC4f0076; __Secure-1PSID=g.a000qwh8HAD7kyB18AURkIGp68pRzrNi4tK9vBQNSA952gWSzsUVRVBQSLJ7SEqsBoC1h4GO3QACgYKAYESARASFQHGX2Miw2bncf00ZPiH3ngF72fauhoVAUF8yKrxiFX_yEOoMolZktRWHaZ60076; __Secure-3PSID=g.a000qwh8HAD7kyB18AURkIGp68pRzrNi4tK9vBQNSA952gWSzsUVyFkm5BnhLGPk4i85ipl7-QACgYKAVoSARASFQHGX2MiDVZXYzJjJn7grcWZCDdmDBoVAUF8yKoggn-hfMaqDgkIkcgeNPyN0076; __Secure-1PSIDTS=sidts-CjEB7wV3sWOUYxriMvBF-NrV4Sg9fLaVY4UP0hW1mFYfi4TDilk-d02qHvt2M9wtFHy8EAA; __Secure-3PSIDTS=sidts-CjEB7wV3sWOUYxriMvBF-NrV4Sg9fLaVY4UP0hW1mFYfi4TDilk-d02qHvt2M9wtFHy8EAA; YSC=13FJEQf2ego; __Secure-ROLLOUT_TOKEN=COetxPi197bKyAEQ5omXl9y8igMY5omXl9y8igM%3D; _gcl_au=1.1.1286731239.1734916655; PREF=f6=40000080&tz=America.Sao_Paulo&f5=30000&f7=100&repeat=NONE; SIDCC=AKEyXzUuC6ea2t49FZF3Zxv07pMqvrlZ4KXKYwsyAQBjAR8JWNiGf6klX9O9KCzckiAtZmGamg; __Secure-1PSIDCC=AKEyXzVdegFtNMTlWcyUngnb0VlgVCILkIR55tM_KEUfBFYUbsHbrZPu6nJ41A5T02td99KBrQ; __Secure-3PSIDCC=AKEyXzUsRhJ2qZR7wSVLqGbYxZFVuEoq9K7KC2hwKCPBiL5sNJo8bIK5xDS3Asdq4k-R2DvKxkA

     User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36
  '';

}
