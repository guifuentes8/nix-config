{ lib, stdenvNoCC, fetchFromGitHub, gtk-engine-murrine }:

stdenvNoCC.mkDerivation {
  pname = "material-gtk-theme";
  version = "20.02.2023";

  src = fetchFromGitHub {
    owner = "Fausto-Korpsvart";
    repo = "Material-GTK-Themes";
    rev = "4d828d5d85bff3307a228c837b9f4fa165a7c30a";
    sha256 = "sha256-2E+ZRnvqzzS986J0ckrV73J1YqMUodj8bVXVStxcfUg=";
  };

  propagatedUserEnvPkgs = [
    gtk-engine-murrine
  ];

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/themes
    cp -a themes/* $out/share/themes
    runHook postInstall
  '';

  meta = with lib; {
    description = "A sddm theme inspired by Serial experiments lain";
    homepage = "https://github.com/guifuentes8/sddm-theme-corners";
    license = licenses.cc-by-sa-40;
    platforms = platforms.linux;
  };
}
