{ pkgs, inputs, ... }:
let
  addons = inputs.firefox-addons.packages.${pkgs.system};
in
{

  home.file.".mozilla/firefox/guifuentes8/chrome/Colloid" = {
    source = ./chrome/Colloid;
    recursive = true;
  };

  programs.firefox = {
    enable = true;
    profiles = {
      "guifuentes8" = {
        bookmarks = { };
        extensions = with addons; [
          bitwarden
          darkreader
          react-devtools
          translate-web-pages
          ublock-origin
        ];
        extraConfig = '''';
        id = 0;
        name = "cli2nix";
        search = {
          default = "Google";
          force = true;
          order = [
            "DuckDuckGo"
            "Google"
          ];
        };
        settings = {
          "privacy.resistFingerprinting" = false;
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        };
        userChrome = ''
          @import "Colloid/theme.css";
          @import "customChrome.css"; 

        '';
        userContent = ''
          @import "Colloid/colors/light.css";
          @import "Colloid/colors/dark.css";

          @import "Colloid/pages/newtab.css";
          @import "Colloid/pages/privatebrowsing.css";

          @import "Colloid/parts/video-player.css";

        '';

      };
    };
  };
}
