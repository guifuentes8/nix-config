{ inputs, ... }: {

  # For every flake input, aliases 'pkgs.inputs.${flake}' to
  # 'inputs.${flake}.packages.${pkgs.system}' or
  # 'inputs.${flake}.legacyPackages.${pkgs.system}'
  flake-inputs = final: _: {
    inputs = builtins.mapAttrs (_: flake:
      let
        legacyPackages = (flake.legacyPackages or { }).${final.system} or { };
        packages = (flake.packages or { }).${final.system} or { };
      in if legacyPackages != { } then legacyPackages else packages) inputs;
  };
  modifications = final: prev: {
    nchat = prev.nchat.overrideAttrs (old: rec {
      version = "4.41";
      pname = "nchat";
      src = prev.fetchFromGitHub {
        owner = "d99kris";
        repo = pname;
        rev = "v${version}";
        hash = "sha256-P+QprQDXUv5uCa/6+RXYImWDL0DIG+p8KFiGPwK+q0g=";
      };
      cmakeFlags = [ ];
    });
  };
  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
  nur-packages = final: _prev: {
    nur = import inputs.nur {
      system = final.system;
      config.allowUnfree = true;
    };
  };
   neorg = inputs.neorg-overlay.overlays.default;

  nodejs = self: super: {
              nodejs = super.nodejs_22;
              nodejs-slim = super.nodejs-slim_22;
            };


}
