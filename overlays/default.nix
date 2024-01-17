{ outputs, inputs, ... }:
{
  #modifications = final: prev: {
  #  rbw = prev.rbw.overrideAttrs (old: rec {
  #    version = "main";
  #    pname = "rbw";
  #    src = prev.fetchFromGitHub {
  #      owner = "doy";
  #      repo = pname;
  #      rev = "77eeb5b8bd9054529d0f8d551942b27640d22a1e";
  #      hash = "sha256-NjMH99rmJYbCxDdc7e0iOFoslSrIuwIBxuHxADp0Ks4=";
  #    };
  #  });
  #};
}
