{ lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "where-is-my-sddm-theme";
  version = "3fd8338292680f3d1f14ce7b96eba8ba48aaabad";

  src = fetchFromGitHub {
    owner = "stepanzubkov";
    repo = pname;
    rev = version;
    sha256 = "sha256-rGn7HKgiPaVxwsURrveHQCQ2RX2JG0HMlLLwnJCoEKg=";
  };

  installPhase = ''
    mkdir -p $out/share/sddm/themes/where_is_my_sddm_theme/
    cp -r * $out/share/sddm/themes/where_is_my_sddm_theme/
    ls $out/share/sddm/themes/
  '';

  meta = with lib; {
    description = "A sddm theme inspired by Serial experiments lain";
    homepage = "https://github.com/guifuentes8/sddm-theme-corners";
    license = licenses.cc-by-sa-40;
    platforms = platforms.linux;
  };
}
