{ unstable, pkgs, config, configOptions, ... }: {

  imports = [ ];

  home.packages = with unstable; [ pokemonsay fortune-kind ];

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "miloshadzic";
    };
    initExtraFirst = ''
      unset -v SSH_ASKPASS
      fortune -s | pokemonsay -n -W -t -d $(printf "%03d\n" $(shuf -i 1-493 -n 1))
    '';
    initExtra = "";
    shellAliases = {
      # NixOs shortcuts
      gc = "nix-collect-garbage -d && nix-store --gc";
      sgc = "sudo nix-collect-garbage -d && nix-store --gc";

      cjpg = "mogrify -format jpg *.png && rm *.png";
      pick = "xcolor | hyprpicker";
      ls = "lsd";

      # Cli Apps shortcuts
      clock = "tty-clock -c -C 6 -s -S -r -n -D";
      matrix = "cmatrix -b -f -C red";
      climabauru = "girouette -q -c '1h' -L 'pt_BR' -l 'Bauru' -u metric";
      climasp = "girouette -q -c '1h' -L 'pt_BR' -l 'São Paulo' -u metric";
      torrent = "rtorrent";
      gpt = "tgpt";
      feed = "tuifeed";

      # Mail
      mail = "himalaya -a guifuentes8";
      mail2 = "himalaya -a gcf";
      testnet = "speedtest-rs";
      music = "ncmpcpp";

    };
  };
}
