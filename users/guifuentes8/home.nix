{ config, pkgs, ... }:

{

  home.username = "guifuentes8";
  home.homeDirectory = "/home/guifuentes8";
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [


    # WM wayland
    bpytop
    cava
    cmatrix
    dunst
    feh
    gcalcli
    glib
    grim
    himalaya
    kitty
    mpv
    neofetch
    pavucontrol
    playerctl
    ranger
    slurp
    sptlrx
    sway
    swaylock
    swayidle
    todo
    tty-clock
    vim
    waybar
    wayland
    wf-recorder
    wl-clipboard
    xdg-utils
    xfce.thunar
    xfce.xfconf
  ];

  nixpkgs.overlays = [
    (self: super: {
      mpv = super.mpv.override {
        scripts = [ self.mpvScripts.mpris ];
      };
    })
  ];

  xdg.configFile."bpytop/bpytop.conf".source = ./software-configs/bpytop/bpytop.conf;
  xdg.configFile."cava/config".source = ./software-configs/cava/config;
  xdg.configFile."dunst/dunstrc".source = ./software-configs/dunst/dunstrc;
  xdg.configFile."rofi/dracula-theme.rasi".source = ./software-configs/rofi/dracula-theme.rasi;
  xdg.configFile."kitty/".source = ./software-configs/kitty;
  xdg.configFile."mpv/mpv.conf".source = ./software-configs/mpv/mpv.conf;
  xdg.configFile."sptlrx/config.yaml".source = ./software-configs/sptlrx/config.yaml;
  xdg.configFile."sway/config".source = ./software-configs/sway/config;
  xdg.configFile."wallpaper.jpg".source = ./software-configs/wallpaper.jpg;
  xdg.configFile."waybar/config".source = ./software-configs/waybar/config;

  gtk = {
    enable = true;
    cursorTheme.name = "Bibata-Modern-Ice";
    cursorTheme.package = pkgs.bibata-cursors;
    iconTheme.name = "Adwaita";
    iconTheme.package = pkgs.gnome.adwaita-icon-theme;
    theme.package = pkgs.dracula-theme;
    theme.name = "Dracula";
  };

  programs = {

    alacritty = {
      enable = true;
      package = pkgs.alacritty;
      settings = {
        window = {
          opacity = 0.85;
        };
        colors = {
          # Default colors
          primary = {
            background = "0x22212c";
            foreground = "0xf8f8f2";
          };

          # Normal colors
          normal = {
            black = "0x22212c";
            red = "0xff9580";
            green = "0x8aff80";
            yellow = "0xffff80";
            blue = "0x9580ff";
            magenta = "0xff80bf";
            cyan = "0x80ffea";
            white = "0xf8f8f2";
          };

          # Bright colors
          bright = {
            black = "0x22212c";
            red = "0xffaa99";
            green = "0xa2ff99";
            yellow = "0xffff99";
            blue = "0xaa99ff";
            magenta = "0xff99cc";
            cyan = "0x99ffee";
            white = "0xffffff";
          };
        };

      };
    };

    gh = {
      enable = true;
      enableGitCredentialHelper = true;
    };

    git =
      {
        enable = true;
        userName = "Guilherme Fuentes";
        userEmail = "guifuentes8@gmail.com";
        aliases = {
          a = "add .";
          co = "checkout";
          cn = "checkout -b ";
          cm = "commit";
          ps = "push";
          pl = "pull";
          fe = "fetch";
          st = "status";
          undo = "reset HEAD~1 --hard";
        };
      };

    rofi =
      {
        enable = true;
        theme = "~/.config/rofi/dracula-theme.rasi";
      };


    zsh = {
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
      '';
      shellAliases = {

        # Spotify
        spt = "ncspot";
        sptl = "sptlrx --current 'bold,#8be9fd' --before '#bd93f9,faint,italic,strikethrough' --after '#ff79c6,faint'";

        # TTY clock
        clock = "tty-clock -c -C  2 -s -S -r -n -D";

        # Unimatrix
        matrix = "unimatrix -c blue -s 93 -f -a -i  ";

        # Fetch 
        fetch = "neofetch";

        # Himalaya mail
        mail = "himalaya";
        mailsent = "mail -m '[Gmail]/Sent Mail'";
        maild = "mail attachments";
        mailw = "mail write";

        #yt
        yt = "cd && cd ytermusic &&./yt.sh";
      };
    };
  };

}
