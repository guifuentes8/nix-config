{ lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "aerial-sddm-theme";
  version = "7dceae9add6602dc499f9df155cdbe0b15c3b94a";

  src = fetchFromGitHub {
    owner = "3ximus";
    repo = pname;
    rev = version;
    sha256 = "sha256-y/+0H7gW/Tw7ib6eyETL93Iohqf1fMM/qOhE5FZwQPU=";
  };

  installPhase = ''
    mkdir -p $out/share/sddm/themes/${pname}
    cp -r * $out/share/sddm/themes/${pname}
  '';

  meta = with lib; {
    description = "A sddm theme inspired by Serial experiments lain";
    homepage = "https://github.com/3ximus/aerial-sddm-theme";
    license = licenses.cc-by-sa-40;
    platforms = platforms.linux;
  };
}
