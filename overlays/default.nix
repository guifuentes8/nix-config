{ outputs, inputs, ... }:
{
  modifications = final: prev: {
    rbw = prev.rbw.overrideAttrs (old: rec {
      version = "git";
      pname = "rbw";
      src = prev.fetchFromGitHub {
        owner = "doy";
        repo = pname;
        rev = "40a33eca2837a0a11bedab7b1eb4a8b830058807";
        hash = "sha256-8vFlMIGT1Uq7co1vlOhhx0UqzeaqeoZPkGNCgxUIkpA=";

      };
    });
  };
}
