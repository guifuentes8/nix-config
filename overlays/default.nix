{ inputs, ... }: {
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
}
