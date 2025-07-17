{ lib, pkgs, ... }: {

  stylix.base16Scheme =
    lib.mkForce "${pkgs.base16-schemes}/share/themes/monokai.yaml";
  stylix.override = { base00 = "2d2a2e"; };
}
