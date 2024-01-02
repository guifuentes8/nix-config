{ lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "my-config";
  version = "main";

  src = fetchFromGitHub {
    owner = "guifuentes8";
    repo = pname;
    rev = "main";
    hash = "sha256-g51iLkMBV6+y1t2LSeSX5bf3F5TqgHv3yCaMJvX9wgY=";
  };

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share
    cp -r * $out/share
    runHook postInstall
  '';

  meta = with lib; {
    description = "A sddm theme inspired by Serial experiments lain";
    homepage = "https://github.com/guifuentes8/sddm-theme-corners";
    license = licenses.cc-by-sa-40;
    platforms = platforms.linux;
  };
}
