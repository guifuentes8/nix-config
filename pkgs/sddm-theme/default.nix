{ lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "sddm-theme";
  version = "b9029b6393ec76a84acd4d5faa1f5fdc76a591f8";

  src = fetchFromGitHub {
    owner = "guifuentes8";
    repo = pname;
    rev = version;
    sha256 = "sha256-zdlE6GuNFBtk2NtKQXWTpd5Aiv6VH3YWm8u31HYzmQ0=";
  };

  installPhase = ''
    mkdir -p $out/share/sddm/themes/${pname}
    cp -r * $out/share/sddm/themes/${pname}
  '';

  meta = with lib; {
    description = "A sddm theme inspired by Serial experiments lain";
    homepage = "https://github.com/guifuentes8/sddm-theme-corners";
    license = licenses.cc-by-sa-40;
    platforms = platforms.linux;
  };
}
