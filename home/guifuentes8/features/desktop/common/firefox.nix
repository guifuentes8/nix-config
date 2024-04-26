{ pkgs, inputs, ... }: {
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    policies = { DefaultDownloadDirectory = "/home/guifuentes8/Downloads"; };
    profiles."guifuentes8" = {
      isDefault = true;
      id = 0;
      name = "guifuentes8";
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        bitwarden
        react-devtools
        reduxdevtools
        darkreader
        ublock-origin
        firefox-color
        stylus
      ];
    };
  };
}
