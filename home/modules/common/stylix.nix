{ pkgs, lib, outputs, config, ... }:
let
  cursorName = "phinger-cursors-dark";
  cursorPkg = pkgs.unstable.phinger-cursors;
  base16SchemeDefault =
    "${pkgs.base16-schemes}/share/themes/tokyo-night-moon.yaml";
in {

  stylix = {
    enable = true;
    autoEnable = false;
    polarity = "dark";
    base16Scheme = base16SchemeDefault;
    imageScalingMode = "fit";
    override = {
      base02 = "#343A52";
      base03 = "#444B6A";
      base04 = "#787C99";
      base05 = "#A9B1D6";
      base06 = "#CBCCD1";
      base07 = "#D5D6DB";
    };
    cursor = {
      name = cursorName;
      package = cursorPkg;
      size = 32;
    };
    fonts = {
      monospace = {
        name = "JetBrainsMonoNL Nerd Font";
        package = pkgs.nerd-fonts.jetbrains-mono;
      };
    };
    opacity = {
      applications = 1.0;
      terminal = 0.85;
      desktop = 1.0;
    };
    targets = {
      alacritty.enable = true;
      bat.enable = true;
      btop.enable = true;
      cava.enable = true;
      #  chromium.enable = true;
      dunst.enable = true;
      feh.enable = true;
      firefox.enable = true;
      firefox.profileNames = [ "${config.home.username}" ];
      fish.enable = true;
      foot.enable = true;
      fzf.enable = true;
      ghostty.enable = true;
      gitui.enable = true;
      gnome.enable = lib.mkIf (pkgs.stdenv.hostPlatform.isLinux) true;
      gtk.enable = true;
      hyprland.enable = true;
      hyprland.hyprpaper.enable = true;
      hyprlock.enable = true;
      hyprpaper.enable = true;
      i3.enable = true;
      kde.enable = true;
      kitty.enable = true;
      # lightdm.enable = true;
      mako.enable = true;
      mpv.enable = true;
      ncspot.enable = true;
      nixvim.enable = false;
      # qt.enable = true;
      qutebrowser.enable = true;
      #  regreet.enable = true;
      rofi.enable = true;
      # starship.enable = true;
      sway.enable = true;
      swaylock.enable = true;
      tmux.enable = true;
      vim.enable = true;
      vscode.enable = false;
      waybar.enable = true;
      wezterm.enable = true;
      wpaperd.enable = true;
      xfce.enable = lib.mkIf (pkgs.stdenv.hostPlatform.isLinux) true;
      yazi.enable = true;
      zathura.enable = true;
    };
  };

  gtk = lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
    enable = true;
    iconTheme = {
      name = lib.mkForce "Papirus-Dark";
      package = pkgs.unstable.catppuccin-papirus-folders;

    };
    cursorTheme = {
      name = cursorName;
      size = 32;
    };
  };

  home.sessionVariables = {
    XCURSOR_THEME = cursorName;
    XCURSOR_SIZE = "32";
  };

}
