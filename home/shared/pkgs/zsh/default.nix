{ pkgs, config, ... }:
{

  home.packages = with pkgs; [
    krabby
  ];
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    # syntaxHighlighting.enable = true; 23.11
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "superjarin";
    };
    initExtraFirst = ''
      unset -v SSH_ASKPASS
      krabby random 1-3 --no-title
    '';
    shellAliases = {
      spt = "spotify_player";
      sptl = "sptlrx --current 'bold,#${config.colorScheme.colors.base00}' --before '#${config.colorScheme.colors.base05},faint,italic,strikethrough' --after '#${config.colorScheme.colors.base0E},faint'";
      clock = "tty-clock -c -C 6 -s -S -r -n -D";
      matrix = "cmatrix -b -f -C cyan";
      fetch = "pfetch";
      mail1 = "himalaya";
      mail1_sync = "himalaya account sync";
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
      telegram = "nchat";
      mattermost = "matterhorn";
      slack = "slack-term -config /home/guifuentes8/.config/slack-term/config -token $(pass show slack)";
      cjpg = "mogrify -format jpg *.png && rm *.png";

      # NixOs shortcuts
      gc = "nix-collect-garbage && nix-store --gc";
    };
  };
}
