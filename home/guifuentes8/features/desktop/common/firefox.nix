{ pkgs, ... }: {
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    policies = { DefaultDownloadDirectory = "/home/guifuentes8/Downloads"; };
    profiles."guifuentes8" = {
      isDefault = true;
      id = 0;
      name = "guifuentes8";
      # TODO
      #  extensions = with pkgs.inputs.firefox-addons; [
      #    bitwarden
      #    react-devtools
      #    reduxdevtools
      #    darkreader
      #    ublock-origin
      #    stylus
      #  ];
    };
  };
}
