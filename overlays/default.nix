{ outputs, inputs, ... }:
{
  modifications = final: prev: {
    # himalaya = prev.himalaya.overrideAttrs (old: rec {
    #   pname = "himalaya";
    #   version = "0.9.0";
    #   src = prev.fetchFromGitHub {
    #     owner = "soywod";
    #     repo = pname;
    #     rev = "v${version}";
    #     hash = "sha256-ScepvT0HWkESiItz0367W9xQ4PsqPwiH9EFtjfuv4PA=";

    #   };
    # });
  };
}
