{ pkgs, inputs, ... }:
let
  addons = inputs.firefox-addons.packages.${pkgs.system};
in
{
  home.sessionVariables = {
    TZ = "America/Sao_Paulo";
  };

  home.file.".mozilla/firefox/guifuentes8/chrome/Colloid" = {
    source = ./chrome/Colloid;
    recursive = true;
  };

  programs.firefox = {
    enable = true;
    profiles = {
      "guifuentes8" = {
        bookmarks = import ./bookmarks.nix;
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


      };
    };
  };
}
