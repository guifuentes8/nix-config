{ unstable, pkgs, config, windowsUser, ... }: {

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
    initExtra = "\n";
    shellAliases = {
      # NixOs shortcuts
      hd =
        "cd ~/nix-config && git add . && home-manager switch --flake .#guifuentes8@nixos";
      sd =
        "cd ~/nix-config && git add . && sudo nixos-rebuild switch --flake .#nixos";
      hl =
        "cd ~/nix-config && git add . && home-manager switch --flake .#guifuentes8@laptop";
      sl =
        "cd ~/nix-config && git add . && sudo nixos-rebuild switch --flake .#laptop";
      gc = "nix-collect-garbage -d && nix-store --gc";
      sgc = "sudo nix-collect-garbage -d && nix-store --gc";

      cjpg = "mogrify -format jpg *.png && rm *.png";
      pick = "xcolor | hyprpicker";
      ls = "lsd";

      # Cli Apps shortcuts
      spt = "spotify_player";
      spt2 = "ncspot";
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
      testnet = "speeedtest-rs";
      music = "ncmpcpp";

    };
  };
}
