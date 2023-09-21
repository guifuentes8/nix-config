{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wineWowPackages.stable
    (lutris.override {
      extraLibraries = pkgs: [
        # List library dependencies here
      ];
    })
  ];
}
