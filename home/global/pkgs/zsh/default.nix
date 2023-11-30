{ unstable, pkgs, config, ... }:
{

  imports = [
    ./syntax-highlight.nix
  ];

  home.packages = with unstable; [
    krabby
  ];
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    # syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "af-magic";
    };
    initExtraFirst = ''
      unset -v SSH_ASKPASS
      krabby random 1-4 --padding-left 5
      
    '';
    initExtra = ''
      ZSH_HIGHLIGHT_HIGHLIGHTERS=(main cursor)
      typeset -gA ZSH_HIGHLIGHT_STYLES
    '';
    shellAliases = {
      spt = "spotify_player";
      sptl = "sptlrx --current 'bold,#${config.colorScheme.colors.base0C}' --before '#${config.colorScheme.colors.base07},faint,italic,strikethrough' --after '#${config.colorScheme.colors.base0E},faint'";
      clock = "tty-clock -c -C 6 -s -S -r -n -D";
      matrix = "cmatrix -b -f -C cyan";
      mail = "himalaya";
      mail_sync = "himalaya account sync";
      mail2 = "himalaya -a gcf";
      mail2_sync = "himalaya -a gcf account sync";
      mailsent = "mail -m '[Gmail]/Sent Mail'";
      maild = "mail attachments";
      mailw = "mail write";
      mailr = "mail -s read";
      xr1 = "xrandr -s 5120x1440";
      xr2 = "xrandr -s 2560x1440";
      xr3 = "xrandr -s 3840x1080";
      xr4 = "xrandr -s 1920x1080";
      yt = "ytfzf -t";
      cal = "gcalcli";
      cjpg = "mogrify -format jpg *.png && rm *.png";
      pick = "xcolor | hyprpicker";

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
