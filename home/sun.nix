{ lib, ... }: {
  imports = [

    # Global config (required)
    ./users/g8.nix

  ];
  stylix.image = lib.mkForce ./modules/common/custom/wallpapers/uranus.jpeg;

}

