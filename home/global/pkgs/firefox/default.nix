{ pkgs, inputs, ... }:
let
  addons = inputs.firefox-addons.packages.${pkgs.system};
in
{
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
        extraConfig = ''
        '';
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
        };
        userChrome = '''';
        userContent = '''';

      };
    };
  };
}
