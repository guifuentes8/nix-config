{ lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "my-config";
  version = "main";

  src = fetchFromGitHub {
    owner = "guifuentes8";
    repo = pname;
    rev = version;
    sha256 = "tIOXPwtgH6MFU4FqC6B1E2kfU0WPPsSMhEP79v6SxvU=";
  };

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/fonts/DankMono
    cp -r fonts/DankMono/* $out/share/fonts/DankMono
    runHook postInstall
  '';

  meta = with lib; {
    description = "A sddm theme inspired by Serial experiments lain";
    homepage = "https://github.com/guifuentes8/sddm-theme-corners";
    license = licenses.cc-by-sa-40;
    platforms = platforms.linux;
  };
}
