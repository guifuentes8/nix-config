{ lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "sddm-theme";
  version = "b63b3915e21c7ad47c973da4cf8cd231efa82193";

  src = fetchFromGitHub {
    owner = "guifuentes8";
    repo = pname;
    rev = version;
    sha256 = "sha256-hFFxee7oGQch1LUWtTj6kcULbXKK1gNz12gCj1OmdUU=";
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
