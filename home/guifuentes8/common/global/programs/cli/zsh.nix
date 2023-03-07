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

      # Spotify
      spt = "ncspot";
      sptl = "sptlrx --current 'bold,#91D7E3' --before '#C6A0F6,faint,italic,strikethrough' --after '#ED8796,faint'";

      # TTY clock
      clock = "tty-clock -c -C  6 -s -S -r -n -D";

      # Unimatrix
      #matrix = "unimatrix -c blue -s 93 -f -a -i  ";
      matrix = "cmatrix -b -f -C cyan";
      # Fetch 
      fetch = "neofetch";

      # Himalaya mail
      mail = "himalaya";
      mailsent = "mail -m '[Gmail]/Sent Mail'";
      maild = "mail attachments";
      mailw = "mail write";

    };
  };
}