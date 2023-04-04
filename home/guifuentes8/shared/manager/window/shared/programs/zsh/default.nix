{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
    initExtraFirst = ''
      unset -v SSH_ASKPASS
      fortune | pokemonsay -d $(printf "%03d\n" $(shuf -i 1-401 -n 1))
    '';
    shellAliases = {

      cat = "bat";

      # Spotify
      spt = "spotify_player";
      #spt = "ncspot";
      sptl = "sptlrx --current 'bold,#f16da6' --before '#6e6f70,faint,italic,strikethrough' --after '#33b1ff,faint'";

      # TTY clock
      clock = "tty-clock -c -C 6 -s -S -r -n -D";

      # Unimatrix
      matrix = "cmatrix -b -f -C cyan";

      # Fetch 
      fetch = "pfetch";

      # Himalaya mail
      mail = "himalaya";
      mailsent = "mail -m '[Gmail]/Sent Mail'";
      maild = "mail attachments";
      mailw = "mail write";

      # X11 Resolutions
      xr1 = "xrandr -s 5120x1440";
      xr2 = "xrandr -s 1920x1080";
      xr3 = "xrandr -s 3840x1080";

      # gcalcli
      cal = "gcalcli";

      #themes
      carbonfox = "pastel color 161616 f2f4f8 2a2a2a f2f4f8 161616 25be6a f2f4f8 78a9ff 535353 3ddbd9 78a9ff 0c0c0c 2a2a2a 6e6f70 282828 ee5396 25be6a 08bdba 78a9ff be95ff 33b1ff dfdfe0 484848 f16da6 46c880 2dc7c4 8cb6ff c8a5ff 52bdff e4e4e5 3ddbd9 ff7eb6 | pastel format";

    };
  };
}
