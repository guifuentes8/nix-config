{ pkgs, lib, ... }:
{
  programs.firefox = {
    enable = true;
    package = pkgs.unstable.firefox;
    policies = {
      DefaultDownloadDirectory = "/home/guifuentes8/Downloads";
    };
    profiles."guifuentes8" = {
      isDefault = true;
      id = 0;
      name = "guifuentes8";

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

}
