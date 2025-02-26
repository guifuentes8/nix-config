{ lib, stdenvNoCC, fetchurl }:

stdenvNoCC.mkDerivation rec {
  pname = "everforest-cursors";
  version = "master";

  src = fetchurl {
    url =
      "https://github.com/talwat/everforest-cursors/releases/latest/download/everforest-cursors-variants.tar.bz2";
    sha256 = "sha256-xXgtN9wbjbrGLUGYymMEGug9xEs9y44mq18yZVdbiuU=";
  };

  sourceRoot = ".";

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/icons
    cp -r ./everforest-cursors* $out/share/icons
    runHook postInstall
  '';

  meta = with lib; {
    description = "The most over-engineered cursor theme";
    homepage = "https://github.com/phisch/everforest-cursors";
    platforms = platforms.darwin ++ [ "x86_64-linux" "aarch64-linux" ];
    license = licenses.cc-by-sa-40;
    maintainers = with maintainers; [ moni ];
  };
}
