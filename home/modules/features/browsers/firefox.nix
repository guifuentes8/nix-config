{ pkgs, lib, ... }: {
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    policies = { DefaultDownloadDirectory = "/home/guifuentes8/Downloads"; };
    profiles."guifuentes8" = {
      isDefault = true;
      id = 0;
      name = "guifuentes8";
      # TODO
      extensions = with pkgs.inputs.nur.repos.rycee.firefox-addons; [
        bitwarden
        darkreader
        floccus
        react-devtools
        reduxdevtools
        stylus
        ublock-origin
      ];
    };
  };
  xdg.mimeApps = {
    enable = true;
    defaultApplications = let
      urls = [
        "text/html"
        "x-scheme-handler/http"
        "x-scheme-handler/https"
        "x-scheme-handler/about"
        "x-scheme-handler/unknown"
      ];

    in (lib.genAttrs urls (_: [ "firefox.desktop" ]));
  };
}
