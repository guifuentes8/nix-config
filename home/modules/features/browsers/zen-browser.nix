{ inputs, pkgs, ... }: {
  # home.nix
  imports = [ ];

  home.packages = with pkgs;
    [ inputs.zen-browser.packages."${system}".twilight ];

  # programs.zen-browser = {
  #   enable = true;
  #   policies = {
  #     DisableAppUpdate = true;
  #     DisableTelemetry = true;
  #   };
  # };
}
