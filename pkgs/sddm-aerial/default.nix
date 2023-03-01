{ lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "aerial-sddm-theme";
  version = "7dceae9add6602dc499f9df155cdbe0b15c3b94a";

  src = fetchFromGitHub {
    owner = "3ximus";
    repo = pname;
    rev = version;
    sha256 = "sha256-kvis9d9AfQk8tAzQeKTURl56Sqs3dttqPV3wNLvGEiw=";
  };

  installPhase = ''
    mkdir -p $out/share/sddm/themes/${pname}
    cp * $out/share/sddm/themes/${pname}
  '';

  meta = with lib; {
    description = "A sddm theme inspired by Serial experiments lain";
    homepage = "https://github.com/3ximus/aerial-sddm-theme";
    license = licenses.cc-by-sa-40;
    platforms = platforms.linux;
  };
}
