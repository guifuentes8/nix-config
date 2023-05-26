{ pkgs, ... }:
let wallpaper = ./alone.png;
in
{

  services.xserver = {
    displayManager.lightdm = {
      background = ./alone.png;
      enable = true;
      greeters = {
        enso = {
          enable = true;
          blur = true;
        };
        # gtk = {
        #   enable = true;
        #   theme = {
        #     name = "Adwaita";
        #   };
        #   iconTheme = {
        #     name = "Adwaita";
        #   };
        #   cursorTheme = {
        #     name = "Catppuccin-Mocha-Dark-Cursors";
        #     package = pkgs.catppuccin-cursors.mochaDark;
        #     size = 24;
        #   };
        #   clock-format = "%H:%M:%D";
        #   indicators = [
        #     "~host"
        #     "~spacer"
        #     "~clock"
        #     "~spacer"
        #     "~session"
        #     "~language"
        #     "~a11y"
        #     "~power"
        #   ];
        # };
      };
    };
  };
}
