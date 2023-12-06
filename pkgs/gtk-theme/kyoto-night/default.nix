{ lib, stdenvNoCC, fetchFromGitHub, gtk-engine-murrine }:

stdenvNoCC.mkDerivation {
  pname = "oomox-arc-kyotonight";
  version = "git";

  src = fetchFromGitHub {
    owner = "wmwnuk";
    repo = "oomox-arc-kyotonight";
    rev = "master";
    hash = "sha256-lNRd21r0ORahZGnf11vYXOEow8EUULKRMer4eFoVAKg=";
  };

  propagatedUserEnvPkgs = [
    gtk-engine-murrine
  ];

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/themes/Kyoto
    cp -r * $out/share/themes/Kyoto
    runHook postInstall
  '';

  meta = with lib; {
    description = "A sddm theme inspired by Serial experiments lain";
    homepage = "https://github.com/guifuentes8/sddm-theme-corners";
    license = licenses.cc-by-sa-40;
    platforms = platforms.linux;
  };
}
