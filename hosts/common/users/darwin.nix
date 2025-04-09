{
  config,
  inputs,
  outputs,
  pkgs,
  ...
}:
let
  nh_plus = inputs.nh_plus.packages."aarch64-darwin".nh;
in
{

  imports = [
    ../../common
  ];

  users.users.administrador = {
    name = "administrador";
    home = "/Users/administrador";
  };

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      # cleanUp = "zap"; # 25.05
      upgrade = true;
    };
    casks = [
      "google-chrome"
      "nextcloud"
    ];
  };
  environment = {
    systemPackages = with pkgs; [
      nh_plus
    ];
  };

}
