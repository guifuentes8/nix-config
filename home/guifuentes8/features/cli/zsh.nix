{ unstable, pkgs, config, windowsUser, ... }: {

  imports = [ ./starship.nix ];

  home.packages = with unstable; [ pokemonsay fortune-kind ];

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      #theme = "miloshadzic";
    };
    initExtraFirst = ''
      unset -v SSH_ASKPASS
      fortune -s | pokemonsay -n -W -t -d $(printf "%03d\n" $(shuf -i 1-493 -n 1))
      #krabby random 1-4 --padding-left 5 --no-title
    '';
    initExtra = ''
      eval "$(starship init zsh)"

    '';
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
      clock = "tty-clock -c -C 6 -s -S -r -n -D";
      yterm = "bash ~/.local/share/applications/headers.sh";
      matrix = "cmatrix -b -f -C red";
      yt = "ytfzf -t";
      cal = "gcalcli";
      clima-bauru = "girouette -q -c '1h' -L 'pt_BR' -l 'Bauru' -u metric";
      clima-sp = "girouette -q -c '1h' -L 'pt_BR' -l 'São Paulo' -u metric";
      torrent = "rtorrent";
      gpt = "tgpt";
      feed = "tuifeed";
      drive = "gdrive";

      # Mail
      mail = "himalaya -a guifuentes8";
      mail2 = "himalaya -a gcf";
      net-test = "speeedtest-rs";
      music = "ncmpcpp";

      adb =
        "/mnt/c/Users/${windowsUser}/Local\\ Settings/Android/Sdk/platform-tools/adb";
    };
  };
}
