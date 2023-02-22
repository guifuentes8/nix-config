{ config, pkgs, ... }:
let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
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
    lxappearance
    mpv
    neofetch
    pavucontrol
    playerctl
    ranger
    slurp
    sptlrx
    unstable.spotify-player
    sway
    swaylock
    swayidle
    libsixel
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



  xdg.configFile."bpytop/bpytop.conf".source = ./software-configs/bpytop/bpytop.conf;
  xdg.configFile."cava/config".source = ./software-configs/cava/config;
  xdg.configFile."dunst/dunstrc".source = ./software-configs/dunst/dunstrc;
  xdg.configFile."rofi/dracula-theme.rasi".source = ./software-configs/rofi/dracula-theme.rasi;
  xdg.configFile."kitty/dracula-pro.conf".source = ./software-configs/kitty/dracula-pro.conf;
  xdg.configFile."kitty/kitty.conf".source = ./software-configs/kitty/kitty.conf;
  xdg.configFile."mpv/mpv.conf".source = ./software-configs/mpv/mpv.conf;
  xdg.configFile."sptlrx/config.yaml".source = ./software-configs/sptlrx/config.yaml;
  xdg.configFile."sway/config".source = ./software-configs/sway/config;
  xdg.configFile."spotify-player/app.toml".source = ./software-configs/spotify-player/app.toml;
  xdg.configFile."spotify-player/theme.toml".source = ./software-configs/spotify-player/theme.toml;
  xdg.configFile."wallpaper.jpg".source = ./software-configs/wallpaper.jpg;
  xdg.configFile."waybar/config".source = ./software-configs/waybar/config;


  gtk = {
    enable = true;
    cursorTheme.name = "Catppuccin-Macchiato-Dark-Cursors";
    cursorTheme.package = pkgs.catppuccin-cursors.macchiatoDark;
    iconTheme.name = "Adwaita";
    iconTheme.package = pkgs.gnome.adwaita-icon-theme;
    theme = {
      name = "Catppuccin-Macchiato-Standard-Blue-Dark";
      package = unstable.pkgs.catppuccin-gtk.override {
        accents = [ "blue" ];
        variant = "macchiato";
      };
    };
  };


  programs = {

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
        spt = "spotify_player";
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


  nixpkgs.overlays = [
    (self: super: {
      mpv = super.mpv.override {
        scripts = [ self.mpvScripts.mpris ];
      };
    })
  ];

}
