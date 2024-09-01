{ inputs, ... }: {

  modifications = final: prev: {
    #  rbw = prev.rbw.overrideAttrs (old: rec {
    #    version = "main";
    #    pname = "rbw";
    #    src = prev.fetchFromGitHub {
    #      owner = "doy";
    #      repo = pname;
    #      rev = "${version}";
    #      hash = "sha256-ScVXtNk2QtfAQn6PtQkbDJNLWAu49l55s6Zpf1fiVjM=";
    #    };
    #  });

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
