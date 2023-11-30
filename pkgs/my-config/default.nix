{ lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "my-config";
  version = "main";

  src = fetchFromGitHub {
    owner = "guifuentes8";
    repo = pname;
    rev = version;
    sha256 = "vMzE56t2GYv3Myknc8nGZBNsRptZ49GGRR56rTD2ptA=";
  };

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/fonts/DankMono
    cp -r fonts/DankMono/* $out/share/fonts/DankMono
    cp -r * $out
    runHook postInstall
  '';

  meta = with lib; {
    description = "A sddm theme inspired by Serial experiments lain";
    homepage = "https://github.com/guifuentes8/sddm-theme-corners";
    license = licenses.cc-by-sa-40;
    platforms = platforms.linux;
  };
}
