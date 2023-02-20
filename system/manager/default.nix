{ config, ... }:
{

  imports =
    [
      ./display/greetd.nix
      ./wm/sway.nix
    ];

}
