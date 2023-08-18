{ pkgs, inputs, lib, ... }:
let
  addons = inputs.firefox-addons.packages.${pkgs.system};
in
{
  home.sessionVariables = {
    TZ = "America/Sao_Paulo";
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
          default = "DuckDuckGo";
          force = true;
          order = [
            "DuckDuckGo"
            "Google"
          ];
        };
        settings = {
          "privacy.resistFingerprinting" = false;
        };
        userChrome = lib.mkDefault '''';
        userContent = lib.mkDefault '''';
      };
    };
  };
}
