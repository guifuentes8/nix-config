{ lib, stdenvNoCC, fetchurl }:

stdenvNoCC.mkDerivation rec {
  pname = "everforest-cursors";
  version = "main";

  src = fetchurl {
    url =
      "https://github.com/talwat/everforest-cursors/releases/download/3212590527/everforest-cursors-variants.tar.bz2";
    sha256 = "sha256-xXgtN9wbjbrGLUGYymMEGug9xEs9y44mq18yZVdbiuU=";
  };

  sourceRoot = ".";

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/icons
    cp -r *  $out/share/icons
    runHook postInstall
  '';

  meta = with lib; {
    description = "The most over-engineered cursor theme";
    homepage = "https://github.com/phisch/everforest-cursors";
    platforms = platforms.unix;
    license = licenses.cc-by-sa-40;
    maintainers = with maintainers; [ moni ];
  };
}
