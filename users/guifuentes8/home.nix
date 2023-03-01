{ config, pkgs, outputs, ... }:
let
  # unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
  swww = outputs.packages.${pkgs.system}.swww;

in
{

  home.username = "guifuentes8";
  home.homeDirectory = "/home/guifuentes8";
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [

    # WM wayland
    bottom
    cava
    cmatrix
    dunst
    feh
    gcalcli
    glib
    grim
    himalaya
    lxappearance
    neofetch
    pavucontrol
    playerctl
    ranger
    slurp
    sptlrx
    sway
    swaylock
    swayidle
    swww
    libsixel
    todo
    tuifeed
    tty-clock
    vim
    waybar
    wayland
    wdisplays
    wf-recorder
    wl-clipboard
    xdg-utils
    xfce.thunar
    xfce.xfconf
    ytfzf
  ];

  xdg.configFile."bottom/bottom.toml".source = ./software-configs/bottom/bottom.toml;
  xdg.configFile."bpytop/bpytop.conf".source = ./software-configs/bpytop/bpytop.conf;
  xdg.configFile."bpytop/themes/catppuccin_macchiato.theme".source = ./software-configs/bpytop/themes/catppuccin_macchiato.theme;
  xdg.configFile."cava/config".source = ./software-configs/cava/config;
  xdg.configFile."dunst/dunstrc".source = ./software-configs/dunst/dunstrc;
  xdg.configFile."foot/foot.ini".source = ./software-configs/foot/foot.ini;
  xdg.configFile."hypr/hyprland.conf".source = ./software-configs/hypr/hyprland.conf;
  xdg.configFile."hypr/hyprpaper.conf".source = ./software-configs/hypr/hyprpaper.conf;
  xdg.configFile."kitty/kitty.conf".source = ./software-configs/kitty/kitty.conf;
  xdg.configFile."kitty/catppuccin-macchiato.conf".source = ./software-configs/kitty/catppuccin-macchiato.conf;
  xdg.configFile."mpv/mpv.conf".source = ./software-configs/mpv/mpv.conf;
  xdg.configFile."rofi/catppuccin-macchiato.rasi".source = ./software-configs/rofi/catppuccin-macchiato.rasi;
  xdg.configFile."sptlrx/config.yaml".source = ./software-configs/sptlrx/config.yaml;
  xdg.configFile."sway/config".source = ./software-configs/sway/config;
  xdg.configFile."spotify-player/app.toml".source = ./software-configs/spotify-player/app.toml;
  xdg.configFile."spotify-player/theme.toml".source = ./software-configs/spotify-player/theme.toml;
  xdg.configFile."waybar/config".source = ./software-configs/waybar/config;
  xdg.configFile."ytfzf/conf.sh".source = ./software-configs/ytfzf/conf.sh;


  xdg.configFile."wallpapers" = {
    source = ./software-configs/wallpapers;
    recursive = true;
  };

  gtk = {
    enable = true;
    cursorTheme.name = "Catppuccin-Macchiato-Dark-Cursors";
    cursorTheme.package = pkgs.catppuccin-cursors.macchiatoDark;
    iconTheme.name = "Adwaita";
    iconTheme.package = pkgs.gnome.adwaita-icon-theme;
    theme = {
      name = "Catppuccin-Macchiato-Standard-Blue-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "blue" ];
        variant = "macchiato";
      };
    };
  };

  programs = {

    ncspot = {
      enable = true;
      settings = {
        use_nerdfont = true;
        flip_status_indicators = true;
        volnorm = true;
        notify = true;
        theme = {
          background = "default";
          primary = "#cdd6f4";
          secondary = "bac2de";
          title = "#cba6f7";
          playing = "#cba6f7";
          playing_selected = "#000000";
          playing_bg = "default";
          highlight = "#000000";
          highlight_bg = "#a6e3a1";
          error = "black";
          error_bg = "#f38ba8";
          statusbar = "#191414";
          statusbar_progress = "#cba6f7";
          statusbar_bg = "#cba6f7";
          cmdline = "#cdd6f4";
          cmdline_bg = "#191414";
          search_match = "#f38ba8";
        };

      };
    };

    kitty = {
      enable = true;
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
        theme = "~/.config/rofi/catppuccin-macchiato.rasi";
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
  };

}
