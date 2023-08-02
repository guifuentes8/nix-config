{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
    initExtraFirst = ''
      unset -v SSH_ASKPASS
      krabby random 1-3 --no-title
    '';
    shellAliases = {

      # Spotify
      spt = "spotify_player";

      sptl = "sptlrx --current 'bold,#a6e3a1' --before '#b4befe,faint,italic,strikethrough' --after '#89b4fa,faint'";

      # TTY clock
      clock = "tty-clock -c -C 6 -s -S -r -n -D";

      matrix = "cmatrix -b -f -C cyan";

      # Fetch 
      fetch = "pfetch";

      # Himalaya mail
      mail = "himalaya";
      mailsent = "mail -m '[Gmail]/Sent Mail'";
      maild = "mail attachments";
      mailw = "mail write";
      mailr = "mail -s read";

      # X11 Resolutions
      xr1 = "xrandr -s 5120x1440";
      xr2 = "xrandr -s 1920x1080";
      xr3 = "xrandr -s 3840x1080";

      # gcalcli
      cal = "gcalcli";

      # telegram
      telegram = "nchat";

      # mattermost 
      mattermost = "matterhorn";

      # slack
      slack = "slack-term -config /home/guifuentes8/.config/slack-term/config -token $(pass show slack)";

      #convert png to jpg
      cjpg = "mogrify -format jpg *.png && rm *.png";

      # NixOs shortcuts
      gc = "nix-collect-garbage && nix-store --gc";
    };
  };
}
