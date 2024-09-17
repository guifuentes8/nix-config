{ lib, fetchurl, appimageTools }:

let
  pname = "zen-browser";
  version = "1.0.0-a.39";
  src = fetchurl {
    url =
      "https://github.com/${pname}/desktop/releases/download/${version}/zen-specific.AppImage";
    sha256 = "sha256-tFci3PttYYhkSPrABW8LHSm95h5v7t1GIZWzdtsOF9Q=";
  };
  appimageContents = appimageTools.extractType2 { inherit pname src version; };

in appimageTools.wrapType2 {
  inherit pname src version;

  extraPkgs = pkgs: with pkgs; [ ffmpeg ];

  extraInstallCommands = ''
      ls -la $out/bin/zen-browser
    mv $out/bin/zen-browser-1.0.0-a.39-bwrap $out/bin/${pname}
    install -m 444 -D ${appimageContents}/${pname}-${version}.desktop -t $out/share/applications
    substituteInPlace $out/share/applications/${pname}-${version}.desktop --replace 'Exec=AppRun --no-sandbox' 'Exec=${pname}-${version}'
    cp -r ${appimageContents}/usr/share/icons $out/share
  '';

  meta = with lib; {
    description = "A fully open source & end-to-end encrypted note taking app.";
    homepage = "https://shotcut.com";
    license = licenses.gpl3Only;
    platforms = [ "x86_64-linux" ];
  };
}

