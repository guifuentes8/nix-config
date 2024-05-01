{ pkgs, ... }: {
  programs.regreet = {
    enable = true;
    settings = {
      # SPDX-FileCopyrightText: 2022 Harish Rajagopal <harish.rajagopals@gmail.com>
      #
      # SPDX-License-Identifier: GPL-3.0-or-later

      background = {

        # Path to the background image
        path = "/usr/share/backgrounds/greeter.jpg";

        # How the background image covers the screen if the aspect ratio doesn't match
        # Available values: "Fill", "Contain", "Cover", "ScaleDown"
        # Refer to: https://docs.gtk.org/gtk4/enum.ContentFit.html
        # NOTE: This is ignored if ReGreet isn't compiled with GTK v4.8 support.
        fit = "Contain";

      };
      # The entries defined in this section will be passed to the session as environment variables when it is started
      env = {
        ENV_VARIABLE = "value";

      };

      GTK = {

        # Whether to use the dark theme
        application_prefer_dark_theme = true;

        # Cursor theme name
        cursor_theme_name = "Adwaita";

        # Font name and size
        font_name = "Cantarell 16";

        # Icon theme name
        icon_theme_name = "Adwaita";

        # GTK theme name
        theme_name = "Adwaita";

      };
      commands = {

        # The command used to reboot the system
        reboot = [ "systemctl" "reboot" ];

        # The command used to shut down the system
        poweroff = [ "systemctl" "poweroff" ];
      };
    };
  };
  services.greetd = {
    vt = 9;
    enable = true;
    settings = {
      # default_session = {
      #   command =
      #     "${pkgs.greetd.tuigree}/bin/tuigreet --cmd Hyprland -t --asterisks -r --remember-user-session --user-menu -g 'Welcome, Guilherme!' --power-shutdown 'shutdown -h now' --power-reboot 'shutdown -r now'";
      user = "guifuentes8";
    };
    # };
  };

  boot.kernelParams = [ "console=tty1" ];

}
