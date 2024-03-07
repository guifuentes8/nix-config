{ outputs, ... }: {
  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
      permittedInsecurePackages = [
        "python-2.7.18.6"
        "electron-12.2.3"
        "electron-19.1.9"
        "electron-24.8.6"
        "mailspring-1.12.0"
      ];
    };
  };

}
