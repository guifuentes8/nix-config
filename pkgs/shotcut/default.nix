{ lib, fetchurl, appimageTools }:

let
  pname = "shotcut";
  version = "23.06.14";
  src = fetchurl {
    url = "https://github.com/mltframework/shotcut/releases/download/v23.06.14/shotcut-linux-x86_64-230614.AppImage";
    sha256 = "sha256-LvNCuOtQ5dB5CLdfSov5ayyU6zWlbwqLSlmy0JGNtO0=";
  };
  appimageContents = appimageTools.extractType2 { inherit pname src version; };
in

appimageTools.wrapType2 {
  inherit pname src version;

  extraPkgs = pkgs: with pkgs; [
    ffmpeg
  ];

  extraInstallCommands = ''
    mv $out/bin/${pname}-${version} $out/bin/${pname}
    install -m 444 -D ${appimageContents}/shotcut.desktop -t $out/share/applications
    substituteInPlace $out/share/applications/shotcut.desktop --replace 'Exec=AppRun --no-sandbox' 'Exec=${pname}'
    cp -r ${appimageContents}/usr/share/icons $out/share
  '';

  meta = with lib; {
    description = "A fully open source & end-to-end encrypted note taking app.";
    homepage = "https://shotcut.com";
    license = licenses.gpl3Only;
    platforms = [ "x86_64-linux" ];
  };
}
