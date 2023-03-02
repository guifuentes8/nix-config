{ lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "sddm-theme";
  version = "7ac585dc04bc7dc60ddd5c0bf360f7469a3620bf";

  src = fetchFromGitHub {
    owner = "CuteOS";
    repo = pname;
    rev = version;
    sha256 = "sha256-XJCxFRjDtc0EGT6jcEDq72semI+SxwL+k2BJ6YAeRoo=";
  };

  installPhase = ''
    mkdir -p $out/share/sddm/themes/${pname}
    cp -r * $out/share/sddm/themes/${pname}
  '';

  meta = with lib; {
    description = "A sddm theme inspired by Serial experiments lain";
    homepage = "https://github.com/CuteOS/sddm-theme";
    license = licenses.cc-by-sa-40;
    platforms = platforms.linux;
  };
}
