{ unstable, pkgs, config, ... }:
{

  imports = [
    ./starship.nix
    ./syntax-highlight.nix
  ];

  home.packages = with unstable; [
    krabby
  ];

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      # theme = "af-magic";
    };
    initExtraFirst = ''
      unset -v SSH_ASKPASS
      krabby random 1-4 --padding-left 5 --no-title
    '';
    initExtra = ''
       #compdef dstask
       #autoload
      _dstask() {
        compadd -- $(dstask _completions "$words[@]")
      }
      compdef _dstask dstask

      eval "$(starship init zsh)"

    '';
    shellAliases = {
      spt = "spotify_player";

      clock = "tty-clock -c -C 6 -s -S -r -n -D";
      matrix = "cmatrix -b -f -C cyan";

      mail = "himalaya";
      mail_sync = "himalaya account sync";
      mail2 = "himalaya -a gcf";
      mail2_sync = "himalaya -a gcf account sync";
      mails = "mail -m '[Gmail]/Sent Mail'";
      maild = "mail attachments";
      mailw = "mail write";
      mailr = "mail -s read";

      yt = "ytfzf -t";
      cal = "gcalcli";
      clima-bauru = "girouette -q -c '1h' -L 'pt_BR' -l 'Bauru' -u metric";
      clima-sp = "girouette -q -c '1h' -L 'pt_BR' -l 'São Paulo' -u metric";
      torrentd = "webtorrent";

      cjpg = "mogrify -format jpg *.png && rm *.png";
      pick = "xcolor | hyprpicker";
      ls = "lsd";

      # NixOs shortcuts
      hd = "cd ~/nix-config && git add . && home-manager switch --flake .#guifuentes8@desktop";
      sd = "cd ~/nix-config && git add . && sudo nixos-rebuild switch --flake .#desktop";
      hl = "cd ~/nix-config && git add . && home-manager switch --flake .#guifuentes8@laptop";
      sl = "cd ~/nix-config && git add . && sudo nixos-rebuild switch --flake .#laptop";
      gc = "nix-collect-garbage -d && nix-store --gc";
      sgc = "sudo nix-collect-garbage -d && nix-store --gc";

    };
  };
}
